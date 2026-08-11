# Day 42: Runners - GitHub-Hosted & Self-Hosted

## 1. GitHub-Hosted Runners (Task 1)
* **What is a GitHub-hosted runner?** 
  A virtual machine managed and hosted by GitHub with pre-installed operating systems, developer tools, and runtimes.
* **Who manages it?** 
  GitHub handles maintenance, security updates, scaling, and provisioning automatically.

---

## 2. Pre-installed Tools Importance (Task 2)
* **Why does it matter that runners come with tools pre-installed?**
  It speeds up CI/CD pipelines significantly because we don't need to spend time installing runtimes, compilers, or utilities (like Docker, Python, Node, Git) on every single run.

---

## 3. Labels Usefulness (Task 5)
* **Why are labels useful when you have multiple self-hosted runners?**
  They allow you to target specific hardware, operating systems, or environments (e.g., routing GPU-heavy jobs to a runner with a dedicated graphics card, or staging vs production servers).

---

## 4. GitHub-Hosted vs Self-Hosted Comparison (Task 6)

| Feature | GitHub-Hosted | Self-Hosted |
| :--- | :--- | :--- |
| **Who manages it?** | GitHub | You / Your organization |
| **Cost** | Free tier limits / Pay-per-use | Free compute (your own hardware/cloud VM cost) |
| **Pre-installed tools** | Extensive suite of SDKs and tools | Only what you install |
| **Good for** | Standard public/private repositories, standard OS environments | Custom hardware requirements, internal network access, cost optimization at scale |
| **Security concern** | Isolated ephemeral VMs per job | Persistent machine; potential risk if running untrusted public PR code |

---

## 5. Workflow Files Implemented
* `.github/workflows/github-runners.yml`
* `.github/workflows/self-hosted.yml`
