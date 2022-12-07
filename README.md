# Framework_DL

## __Prerequisites__ 
---------------------
1. Instal python, pip and webdrivers - [Video Tutorial](https://www.youtube.com/watch?v=gleaQkECggo)

2. Install in VS Code extensions: 
- Robot Code 
- Python
- Cucumber(Gherkin) Full Support 
- IntelliCode

## __For parallel execution__
-------------------
- __Install pabot__
```json
 pip install -U robotframework-pabot
 ```

 - __For test running use command__
 ```
 pabot --testlevelsplit --processes [nr of processes] --outputdir [dir for results] [path to tests]
 (ex. pabot --testlevelsplit --processes 4   --outputdir ParallelTesting  Tests/Sanity.robot)
 ```