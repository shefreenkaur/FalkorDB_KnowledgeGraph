Goal: My main goal is to walk you through my initial setup for FalkorDB, then proceeding to create a KnowledgeGraph and further try to visualize it.
#Implementation
Pre-requisites
1)	Redis cli
Redis is not supported on windows, so if you are using a windows OS, you would need to install WSL2.
Once WSL2 is installed, you would need to install and enable redis. 
--I followed the instructions provided here.-- https://redis.io/docs/latest/operate/oss_and_stack/install/install-redis/install-redis-on-windows/ 
2)	Docker

Set-up
1)	Start with loading docker first

--Usually I prefer to load docker right after I restart my computer, otherwise it takes too long or sometimes doesn’t load if many (or less) applications are already running.--

 
	The command provided is taken directly from FalkorDB website.
Command1: 
docker run -p 6379:6379 -p 3000:3000 -it --rm -v ./data:/data falkordb/falkordb:edge

2)	Open ubuntu
(keep the other docker terminal running)
Command 2:
redis-cli ping

 
	--the second command is just to test if redis cli is working properly.--
3)	Manually loading FalkorDB into Redis using a local connection

Command 3:
docker ps

--to check the Container ID --
 
	Command 4:
	docker exec -it 01f65346240c redis-cli
	Command 5:
	MODULE LIST (optional)
Creating a knowledge Base
1)	I will be creating a Knowledge Base based on the command’s documentation provided by FalkorDB. It uses Cypher language.

The script file I used is based on an already created UML Class diagram of the University from my COMP 370 course. I attached the reference for that in the end.
The script is available in the repository.
2)	Copying the script file to the container 

Command 6:

docker cp <script_location> <container_ID>:/<Filename_of_your_choice.lua>

--we are copying the script file to the docker container--
 
	
3)	Running the script file
Command 7: 
docker exec -it < container_ID> bash
Command 8:
/FalkorDB# redis-cli --eval /< Filename_of_your_choice.lua>
--This will create the whole knowledge base including nodes and edges.—
 
Visualizing the Knowledge Graph
Go to the terminal where docker is running and then open the link provided:
http://localhost:3000 
 
 
--ignore everything and just click connect—









--select graph: University Graph--
 
--where you see the ‘Query 1’, type in the following query to view both the nodes and the relationships—
Query: MATCH (n)-[r]->(m) RETURN n, r, m LIMIT 100 
 

 
References for implementation.
1)"GitHub - FalkorDB/FalkorDB: A super fast Graph Database uses GraphBLAS ...." https://github.com/FalkorDB/FalkorDB.
2) "Install Redis | Docs." https://redis.io/docs/latest/operate/oss_and_stack/install/install-redis/.
3) UML Class Diagram
 

4)	"Commands - FalkorDB Docs." https://docs.falkordb.com/commands/.



