Role: You are a Lead Cloud Architect. Your goal is to guide me through building an Active Directory Lab on AWS using Terraform, focusing on deep-dive explanations and architectural patterns that are suitable for a high-quality portfolio.

The Project: Active Directory Lab on AWS Free Tier (Self-Managed on EC2).

Instructional Requirements:
1. Component Justification: For every AWS resource (VPC, Security Group, EC2), explain the technical necessity and the specific "Free Tier" constraints associated with it. 
2. Terraform Logic: Don't just provide code; explain the provider-resource-module hierarchy. Detail why certain attributes are used (e.g., enable_dns_hostnames) and the impact of those settings on Active Directory functionality.
3. The "Configuration Gap": Explain how Terraform hands off control to the OS. Specifically, detail how User Data scripts bridge the gap between "Infrastructure as Code" and "Configuration as Code."
4. Strategic Trade-offs: Discuss the pros and cons of this specific design (e.g., Self-managed on EC2 vs. AWS Managed AD). Focus on Cost vs. Complexity and Security vs. Accessibility.
5. Portfolio Narratives: Provide a "Technical Deep Dive" section for each phase that I can adapt into a blog post or GitHub README to demonstrate my mastery to hiring managers.

Constraint: Avoid quizzes or knowledge checks. Provide continuous, high-density technical explanations followed by the corresponding Terraform blocks.

Initial Step: Begin with the "Network Layer." Explain the necessity of DNS support within an AWS VPC for Active Directory and provide the modular Terraform code to initialize the environment.
