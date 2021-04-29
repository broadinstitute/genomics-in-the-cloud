---
layout: post
title: What's in the can? Part 1: A casual take on the Table of Contents
---

Are you ever frustrated by how little actionable information you can find in book listings when you shop online? In a physical store at least you could leaf through any part of the book to get a really good sense of what it covers and to what level of detail, but online you're really limited to the general summary and whatever the publisher chooses to make available as a content preview. 

And frankly, I think our book is no exception -- when I look at the [Amazon listing](https://www.amazon.com/Genomics-Cloud-GATK-Spark-Docker-dp-1491975199/dp/1491975199) (which we don't have direct control over as authors), I can't help thinking that if I were browsing it as a prospective user, I would have a hard time deciding whether or not it was right for me. So I decided to write a short series of blog posts dedicated to providing insight into what our book is about, and what it's like to work through, to supplement the information provided in the listing.

In this first installment, I recycled an [old Twitter thread](https://twitter.com/VdaGeraldine/status/1263336914859560962?s=20) that people seemed to find helpful, consisting of one tweet per chapter, each providing a brief and informal description of the chapter's topic and goals. The format and Twitter's brutally low character limit forced me to be very concise, and really drill down to the essentials. As part of that, I decided to emphasize the progression from one topic to the next, to reflect our vision of the book as an educational journey rather than a collection of facts. (More on that later)

Anyway, here it is: 

**1. Introduction**
Why you should care about the cloud, and how bioinformatics / life sciences research benefits from moving to a cloud-based ecosystem for data sharing and analysis. No, the cloud environment is not perfect; yes, it really is a game changer.

**2. Genomics in a Nutshell**
A primer for newcomers to the field of genomics, covering foundational terms and concepts such as genes, DNA and genomic variation, plus the technical basics of sequencing and handling genomic data.

**3. Computing Technology Basics for Life Scientists**
CPU, GPU, TPU, FPGA, OMG GTFO -- no really, just some basic hardware terminology, plus an introduction to key concepts like parallelism, pipelining, containers and virtual machines in fairly plain language.

**4. First Steps in the Cloud**
Finally we get to do some hands-on work (on Google Cloud). Set up an account, get free credits, practice managing data in storage buckets and interacting with a Docker container, get a nice custom VM set up to do some genomics.

**5. First Steps with GATK**
Let's meet the workhorse of genomics! We start with a general overview, requirements, command line syntax, the usual -- then dive into calling variants with HaplotypeCaller, plus some visual troubleshooting and variant filtering concepts.

**6. GATK Best Practices for Germline Short Variant Discovery**
Step by step examination of what may be the most commonly run genomics pipeline in the world, with highlights on joint calling for populations and deep learning for single-sample analysis.

**7. GATK Best Practices for Somatic Variant Discovery**
Switching gears to cancer genomics with a rundown of how somatic calling is different; step by step through the pipelines for somatic short variants (Mutect2) and copy number alterations.

**8. Automating Analysis Execution with Workflows**
Halfway point; we pivot to the challenges of automating and scaling up these analyses, introducing the Cromwell workflow system and the portable Workflow Description Language (WDL).

**9. Deciphering Real Genomics Workflows**
We pretend to stumble across 2 mystery workflows, go through a systematic process of investigating their content to understand what they do and how they do it, learning useful WDL features along the way.

**10. Running Single Workflows at Scale with Pipelines API**
So far we've been running everything on our little custom VM. Now it's time to unleash the full power of the cloud by dispatching workflow tasks to multiple machines -- with surprisingly little effort.

**11. Running Many Workflows Conveniently in Terra**
Now we're scaling up to arbitrary numbers of samples, using the managed Cromwell server in Terra, an open platform for secure data access and analysis. 

**12. Interactive Analysis in Jupyter Notebook**
Circling back to the GATK work from earlier chapters, we examine what that would all look like done in Jupyter Notebooks instead of the terminal shell. Between embedded IGV and ggplots galore, it looks good!

**13. Assembling Your Own Workspace in Terra**
Crossing the bridge from canned examples to importing your own data and methods into Terra in a few different scenarios. Draws on other services in the ecosystem including Dockstore and data repositories.

**14. Making a Fully Reproducible Paper**
Capstone case study on computational reproducibility involving synthetic data creation, GATK, downstream analysis and real biological findings by Dr. Matthieu Miossec et al. 

What you think? Helpful at all? 

In the next installment of "What's in the can?", I'll cover reader reviews, since that's also a source of information that a lot of people use when making a purchase decision. 
