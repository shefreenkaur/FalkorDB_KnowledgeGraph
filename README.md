**Goal:** My main goal is to walk you through my initial setup for FalkorDB, then proceeding to create a KnowledgeGraph and further try to visualize it.
# #Implementation
## Pre-requisites
1) Redis cli

Redis is not supported on windows, so if you are using a windows OS, you would need to install WSL2.

Once WSL2 is installed, you would need to install and enable redis. 

--I followed the instructions provided here.-- <https://redis.io/docs/latest/operate/oss_and_stack/install/install-redis/install-redis-on-windows/> 

2) Docker

## Set-up
1) Start with loading docker first

   --Usually I prefer to load docker right after I restart my computer, otherwise it takes too long or sometimes doesn’t load if many (or less) applications are already running.--

   ![image](https://github.com/user-attachments/assets/f41bc22e-1271-4197-94d1-156813dd0250)


`	`The command provided is taken directly from FalkorDB website.

**Command1*:*** 

*docker run -p 6379:6379 -p 3000:3000 -it --rm -v ./data:/data falkordb/falkordb:edge*

2) Open ubuntu

   (keep the other docker terminal running)

   Command 2:

   *redis-cli ping*

   ![image](https://github.com/user-attachments/assets/e4c48490-8721-4e8c-904a-e4ca0802a0b0)


   `	`--the second command is just to test if redis cli is working properly.--

3) Manually loading FalkorDB into Redis using a local connection

   Command 3:

   *docker ps*

   --to check the Container ID --

   ![image](https://github.com/user-attachments/assets/dd8f38c0-d992-49bf-aaab-cd00fd416e4b)


`	`Command 4:

`	`*docker exec -it 01f65346240c redis-cli*

`	`*Command 5:*

`	`*MODULE LIST (optional)*
## Creating a knowledge Base
1) I will be creating a Knowledge Base based on the command’s documentation provided by FalkorDB. It uses Cypher language.

The script file I used is based on an already created UML Class diagram of the University from my COMP 370 course. I attached the reference for that in the end.

The script is available in the repository.

2) Copying the script file to the container 

   Command 6:

   *docker cp <script\_location> <container\_ID>:/<Filename\_of\_your\_choice.lua>*

   --we are copying the script file to the docker container--

   ![image](https://github.com/user-attachments/assets/dc068afc-6eb5-483d-8688-272065496bfe)




3) Running the script file

   Command 7: 

   *docker exec -it < container\_ID> bash*

   *Command 8:*

   */FalkorDB# redis-cli --eval /< Filename\_of\_your\_choice.lua>*

   --This will create the whole knowledge base including nodes and edges.—
   ![image](https://github.com/user-attachments/assets/7c2aa5cf-ffbc-4319-810d-badbbdbe1d55)


## Visualizing the Knowledge Graph
Go to the terminal where docker is running and then open the link provided:

<http://localhost:3000> 

![image](https://github.com/user-attachments/assets/4227f8dd-7c96-427e-b588-e8b02468f5d6)


![image](https://github.com/user-attachments/assets/bc163f10-5c3f-4a66-81cb-8f24f9720197)

--ignore everything and just click connect—

![image](https://github.com/user-attachments/assets/f71ef6c8-7938-4ed4-bc98-efb37b23d6dd)



--select graph: University Graph--

![image](https://github.com/user-attachments/assets/dab5d85b-5a34-4eb6-aaba-18f3a77b1bf0)


--where you see the ‘Query 1’, type in the following query to view both the nodes and the relationships—

Query: MATCH (n)-[r]->(m) RETURN n, r, m LIMIT 100 

![image](https://github.com/user-attachments/assets/5fb66022-8b1d-4c25-b5d4-86dcb17f2977)


![image](https://github.com/user-attachments/assets/c6eece83-485f-4eb9-93bf-4bddd04a0d90)

## References for implementation.
1)"GitHub - FalkorDB/FalkorDB: A super fast Graph Database uses GraphBLAS ...." <https://github.com/FalkorDB/FalkorDB>.

2) "Install Redis | Docs\." <https://redis.io/docs/latest/operate/oss_and_stack/install/install-redis/>\.

3) UML Class Diagram

![image](https://github.com/user-attachments/assets/8a3cf6fd-86a7-41d2-b378-2df0f1b6787a)


4) "Commands - FalkorDB Docs." <https://docs.falkordb.com/commands/>.



