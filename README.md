**Challenge #1**

3 tier Architecture Diagram

![image](https://github.com/khandu443/InterviewDemo/assets/17494148/7ee2ea4a-4e51-4773-969b-8fa374f00e9d)

The terraform code wil create following resources
1. Two web servers in 2 different availability zones.
2. A database instance
3. An Internet gateway
4. A NAT Gateway
5. Publc and Private subnets for web servers and app server respectively. db instance will also deployed in private subnet

**Scope for improvements**: I have not used var files separately, but we can create variable file and use variables in templates.

**Challenge #2**

Please run Ch-2_InstanceMetadata/instance_metadata.sh script to get instance metadata
This script will retrive commonly used instance metadata. We can add more commands to get more information from instance metadata


**Challenge #3**
