# VM Health Monitoring Automation using GitHub Copilot Agents

A lightweight Linux shell scripting project that monitors the health of an Ubuntu virtual machine by analyzing:

- CPU utilization
- Memory utilization
- Disk utilization

The project was built as part of an AI-assisted development workflow using GitHub Copilot Agents, where the implementation, validation, testing, commit creation, and pull request workflow were handled collaboratively with AI agents.

---

# Project Overview

Monitoring virtual machines is one of the most common operational tasks in DevOps and infrastructure management.

This project automates basic VM health analysis using a Bash shell script that runs directly on Ubuntu-based systems.

The script checks system resource utilization and determines whether the VM is healthy or not healthy based on threshold conditions.

In addition to the monitoring functionality, this project also explores how GitHub Copilot Agents can participate in real software engineering workflows by:

- Understanding requirements
- Navigating repositories
- Generating code
- Validating scripts
- Running tests
- Creating commits
- Managing pull request workflows

---

# Features

## VM Health Monitoring

The script analyzes:

- CPU usage
- Memory usage
- Disk usage

---

## Health Evaluation

### Healthy State

The VM is considered healthy when:

- CPU usage ≤ 60%
- Memory usage ≤ 60%
- Disk usage ≤ 60%

---

### Not Healthy State

The VM is considered not healthy if any one of these exceeds 60%.

---

## Explain Mode

The script supports an optional command-line argument:

```bash
explain
```

When used, the script explains why the VM is healthy or not healthy.

Example:

```bash
./vm_health.sh explain
```

---

# Project Structure

```text
DevOps-Automation/
│
├── vm_health.sh
├── README.md
└── screenshots/
```

---

# Technologies Used

- Bash Shell Scripting
- Ubuntu Linux
- GitHub Copilot Agents
- Git & GitHub
- ShellCheck
- Linux System Utilities

---

# Linux Commands Used

The script internally uses standard Linux commands such as:

| Command | Purpose |
|---|---|
| `free` | Memory usage |
| `df` | Disk utilization |
| `/proc/stat` | CPU utilization |
| `awk` | Data parsing |
| `bash` | Script execution |

---

# Setup Instructions

## Step 1: Clone Repository

```bash
git clone https://github.com/ArpitaMKalburgi/DevOps-Automation.git
```

---

## Step 2: Navigate to Project

```bash
cd DevOps-Automation
```

---

## Step 3: Make Script Executable

```bash
chmod +x vm_health.sh
```

---

## Step 4: Run the Script

```bash
./vm_health.sh
```

---

# Explain Mode

Run:

```bash
./vm_health.sh explain
```

Example Output:

```text
Health Status: Healthy
Reason: CPU 1%, Memory 14%, Disk 40% are all at or below 60%.
```

---

# Example Outputs

## Healthy VM

```text
Health Status: Healthy
Reason: CPU 12%, Memory 25%, Disk 38% are all at or below 60%.
```

---

## Unhealthy VM

```text
Health Status: Not healthy
Reason: CPU usage is 82% which is above 60%.
```

---

# Script Workflow

```text
User Runs Script
        ↓
Collect CPU Usage
        ↓
Collect Memory Usage
        ↓
Collect Disk Usage
        ↓
Compare Against Thresholds
        ↓
Determine VM Health Status
        ↓
Print Result
```

---

# GitHub Copilot Agent Workflow

One of the most interesting parts of this project was building it using GitHub Copilot Agents.

Instead of manually writing everything from scratch, tasks were assigned directly to the agent through GitHub.

The agent then:

- Analyzed repository structure
- Understood task requirements
- Generated the shell script
- Added health monitoring logic
- Implemented explain mode
- Performed syntax validation
- Ran ShellCheck linting
- Executed the script for testing
- Created commits automatically
- Worked through a pull request style workflow

This project became a practical exploration of AI-assisted software engineering and DevOps workflows.

---

# Copilot Agent Development Lifecycle

The workflow followed a real-world development process:

```text
Task Creation
      ↓
Repository Analysis
      ↓
Code Generation
      ↓
Validation & Testing
      ↓
Linting & Fixes
      ↓
Commit Creation
      ↓
Branch Workflow
      ↓
Pull Request Workflow
      ↓
Merge into Main
```

---

# Validation Performed by Agent

The agent automatically validated the script using:

## Bash Syntax Check

```bash
bash -n vm_health.sh
```

---

## ShellCheck Linting

```bash
shellcheck vm_health.sh
```

---

## Script Execution

```bash
./vm_health.sh explain
```

---

# AI-Assisted Engineering Workflow

This project was not only about writing a shell script.

It was also about understanding how AI agents can participate in actual engineering workflows.

The GitHub Copilot Agent was able to:

- Read repository contents
- Understand instructions
- Write implementation logic
- Fix linting issues
- Execute validations
- Generate commits
- Participate in branch-based development

This demonstrates how AI-assisted development is becoming part of modern software engineering workflows.

---

# Why This Project is Useful

This project helps understand:

- Bash scripting
- Linux monitoring
- Resource utilization analysis
- DevOps automation
- SSH workflows
- GitHub workflow
- AI-assisted development
- Agent-based coding workflows
- Pull request lifecycle
- Linux system administration basics

---

# Running on Ubuntu VM

The script was tested on Ubuntu virtual machines through SSH.

Example SSH connection:

```bash
ssh -i devops-demo.pem ubuntu@<public-ip>
```

Example:

```bash
ssh -i devops-demo.pem ubuntu@98.80.13.194
```

---

# Possible Future Improvements

This project can later support:

- Slack alerts
- Email notifications
- Telegram notifications
- Historical health logging
- Multi-VM monitoring
- Cron-based scheduling
- Real-time dashboards
- Docker container monitoring
- CPU process analysis
- CloudWatch integration

---

# Cron Job Automation

The script can later be automated using cron jobs.

Example:

```bash
*/5 * * * * /home/ubuntu/DevOps-Automation/vm_health.sh
```

This runs the script every 5 minutes.

---

# Security & Best Practices

- Lightweight execution
- No external dependencies
- Uses built-in Linux utilities
- Minimal system overhead
- Safe read-only monitoring

---

# Learning Outcomes

This project provided practical exposure to:

- Linux shell scripting
- Ubuntu VM management
- SSH access
- GitHub workflows
- Git branching
- Pull request workflows
- ShellCheck linting
- AI-assisted software development
- GitHub Copilot Agents
- DevOps automation basics

---

# Screenshots

Recommended screenshots to include:

- VM SSH Connection
- GitHub Copilot Agent Workflow
- Script Execution Output
- Healthy VM Output
- Unhealthy VM Output
- Pull Request Workflow
- ShellCheck Validation

---

# Future Vision

This simple monitoring script can later evolve into:

- Infrastructure Monitoring Tool
- Lightweight Monitoring Agent
- DevOps Automation Utility
- Cloud VM Health Dashboard
- AI-assisted Monitoring Platform