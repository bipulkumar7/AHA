#### Practical exercise
```
The Appsilon project team asked you to install and configure RStudio Connect for their Shiny apps. Please, provide the IaC configuration of the infrastructure. The solution has to be directly runnable and accessible via browser. You can use a free tier of any cloud provider of your choice (AWS, Azure, Google Cloud or any other). Additionally, please satisfy these requirements:

1. The solution follows infrastructure as code principle
2. Create documentation for the client with the low tech skills to be able to reproduce the environment on their own
3. Make sure that time to initialize the deployment is relatively small
4. The repository with code has pipelines that execute linting
```
#### Iac principle
File://Infrastructure as code principle.ipynb

#### Documentation how to run the above code
File://HowToRun.ipynb


### Time
```
Time complexity
File://Post-install2.sh   O(n)

Time taken to install on t2.micro( vCPUs 1, RAM 1 GB, Storage ebs)
   Elapsed time: 326645 ms
```

#### Linting
```
apt-get install yamllint
yamllint -d "{extends: relaxed, rules: {line-length: {max: 120}}}"  stack-003.yml
yamllint -d "{extends: relaxed, rules: {line-length: {max: 120}}}"  stack-002.yml 
```
```
stack-001.yml is warmup it install ec2 instance with security group (Allowing ssh connection)
stack-002.yml Rstudio connect installed
stack-003.yml Install rconnect studio without https connection
```
