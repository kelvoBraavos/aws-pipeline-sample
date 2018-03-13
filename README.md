# AWS CodePipleline 


## Basic Setup
- Need to create a repository in GitHub and push your code inside for testing
- Create a file ‘buildspec.yml’ for your build configurations and pre/post build commands.
- Create an EC2 Instance for your project per your need.
- Setup PHP and Apache into your EC2 instance by accessing via ssh manually.
- Install CodeDeploy agent via https://aws-codedeploy-us-east-1.s3.amazonaws.com/latest/install in your EC2 instance.
- Go to AWS CodePipeline and create your new Project Pipeline.
- In order to create your new pipeline, you need to follow some steps of create pipeline.
- Inside Source, select GitHub or you may select any other available repository source where you have committed your code. After selection you need to give authorization to AWS for that repository.
- After syncing your repository you need to select your desired repository and select your desired branch.
- Inside Build, select AWS CodeBuild, or you may select any other available build provider per your need and availability.
- After selecting Build provider you may configure per your selected option, in our example we are going to setup for AWS CodeBuild, so you may enter a desired Project Name inside configuration section.
- Also you may select your build environment by selecting OS and Runtime environment. Similarly, you may set your environment variables here (if needed).
- This step also create a new role for build services, which you may see inside `AWS CodeBuild Service Role` section
- Inside Deploy, select AWS CodeDeploy for EC2 Instances and create your desired application by clicking `Create a new one in AWS CodeDeploy`.
- You also require to add your EC2 created instance in this step for your deployments by adding a name tag `key` and `value` inside environment section.
- Inside Service Role, create a service role in IAM to give AWS CodePipeline permission to use resources in your account. If you already have a service role configured for this purpose, you can choose it from the list instead of creating a role.
- Inside Review, you may review all your configurations and create your pipeline.
- After creating your pipeline successfully, your build will be deployed automatically or you may manually deploy your builds.
- By following all above steps, your builds will be deployed automatically on every commit (after specific time frame).
- If you are getting any failure on builds deployments, please create a file with your desired configurations in your repository with name ‘appspec.yml’.

## Challenges
- Configuring S3 Bucket for Builds and Revisions
- Extracting Application Build and Setting up Configuration
- Permissions Issues

## Areas Covered
- AWS CodePipeline - This service will help you to model and automate your software release process.
- AWS CodeBuild – A build generator, which is a fully managed build service that compiles source code, runs tests, and produces software packages that are ready to deploy
- AWS CodeDeploy - This service efficiently deploys your released code to a “fleet” of EC2 instances while taking care to leave as much of the fleet online as possible. 
- GitHub instead of AWS CodeCommit -  A source control service that makes it easy for companies to host secure and highly scalable private Git repositories.
- Other Required Services:
	EC2 Instances
	S3 Bucket
	IAM
	AWS Service Role

## Recommendations
- We can utilize AWS CodePipeline for fully automated builds, that covers CI and CD for automated deployments.
- Can also explore to utilize with On Premises, Lamda and EB Instances
- Can utilize Blue Green Deployments with zero downtime
- Can utilize Load Balancers and Auto Scaling features for large scale applications
- We can also use Jenkins or Solano instead of AWS CodeBuild per requirements/client need
- We can also use S3 Bucket, AWS CodeCommit for code repositories instead of GitHub per requirements

## References
https://docs.aws.amazon.com/codedeploy/latest/userguide/codedeploy-agent-operations-install-ubuntu.html 
https://aws.amazon.com/getting-started/tutorials/continuous-deployment-pipeline/
https://aws.amazon.com/blogs/devops/continuous-delivery-for-a-php-application-using-aws-codepipeline-aws-elastic-beanstalk-and-solano-labs/ 
https://github.com/awslabs/aws-codedeploy-samples 