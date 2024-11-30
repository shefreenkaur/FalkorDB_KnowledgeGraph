-- FalkorDB New Knowledge Graph Creation Script

-- Create nodes in new graph named "UniversityGraph"
redis.call("GRAPH.QUERY", "UniversityGraph", "CREATE (:School {name: 'School'})")
redis.call("GRAPH.QUERY", "UniversityGraph", "CREATE (:Employee {name: 'Employee'})")
redis.call("GRAPH.QUERY", "UniversityGraph", "CREATE (:FacultyMember {name: 'FacultyMember'})")
redis.call("GRAPH.QUERY", "UniversityGraph", "CREATE (:NonFacultyMember {name: 'NonFacultyMember'})")
redis.call("GRAPH.QUERY", "UniversityGraph", "CREATE (:Contract {name: 'Contract'})")
redis.call("GRAPH.QUERY", "UniversityGraph", "CREATE (:Department {name: 'Department'})")
redis.call("GRAPH.QUERY", "UniversityGraph", "CREATE (:Student {name: 'Student'})")
redis.call("GRAPH.QUERY", "UniversityGraph", "CREATE (:Committee {name: 'Committee'})")
redis.call("GRAPH.QUERY", "UniversityGraph", "CREATE (:SubCommittee {name: 'SubCommittee'})")
redis.call("GRAPH.QUERY", "UniversityGraph", "CREATE (:Consultant {name: 'Consultant'})")

-- Create relationships between nodes
-- FacultyMember and Department
redis.call("GRAPH.QUERY", "UniversityGraph", [[
    MATCH (f:FacultyMember), (d:Department)
    CREATE (f)-[:WORKS_IN]->(d)
]])

-- Employee and Contract
redis.call("GRAPH.QUERY", "UniversityGraph", [[
    MATCH (e:Employee), (c:Contract)
    CREATE (e)-[:HAS_CONTRACT]->(c)
]])

-- Department and School
redis.call("GRAPH.QUERY", "UniversityGraph", [[
    MATCH (d:Department), (s:School)
    CREATE (d)-[:BELONGS_TO]->(s)
]])

-- Committee and SubCommittee
redis.call("GRAPH.QUERY", "UniversityGraph", [[
    MATCH (c:Committee), (sc:SubCommittee)
    CREATE (sc)-[:REPORTS_TO]->(c)
]])

-- Consultant and Department
redis.call("GRAPH.QUERY", "UniversityGraph", [[
    MATCH (co:Consultant), (d:Department)
    CREATE (co)-[:CONSULTS_FOR]->(d)
]])

-- Student and Department
redis.call("GRAPH.QUERY", "UniversityGraph", [[
    MATCH (s:Student), (d:Department)
    CREATE (s)-[:ENROLLED_IN]->(d)
]])

-- NonFacultyMember and Department
redis.call("GRAPH.QUERY", "UniversityGraph", [[
    MATCH (nf:NonFacultyMember), (d:Department)
    CREATE (nf)-[:ASSIGNED_TO]->(d)
]])

return "New UniversityGraph Created"