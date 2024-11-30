1)docker run -p 6379:6379 -p 3000:3000 -it --rm -v ./data:/data falkordb/falkordb:edge
2)redis-cli ping
3)docker ps
4)docker exec -it <Container_ID> redis-cli
5)MODULE LIST
6)docker cp <script_location> <Container_ID>:/<Filename_of_your_choice.lua>
7)docker exec -it <Container_ID> bash
8)redis-cli --eval /<Filename_of_your_choice.lua>