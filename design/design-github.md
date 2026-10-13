# Working with GitHub: A Guide for Designers

## How to Clone a Repository

Cloning makes a copy of a project from GitHub on your computer so you can open and work on the files locally.

### Option 1: Using GitHub Desktop (recommended)

1. **Install GitHub Desktop.** Download it from [desktop.github.com](https://desktop.github.com) and sign in with your GitHub account.
2. **Find the repository on GitHub.** In your browser, go to the repo page you want to work on.
3. **Click the green "Code" button**, then choose **"Open with GitHub Desktop."**
4. **Choose where to save it.** GitHub Desktop will ask for a folder location on your computer. The default (usually `Documents/GitHub`) is fine.
5. **Click "Clone."** When it finishes, the project files are on your computer. Click **"Show in Finder"** (Mac) or **"Show in Explorer"** (Windows) to open the folder.

### Option 2: Using the terminal

1. **Copy the repo URL.** On the repo page, click the green **"Code"** button and copy the HTTPS link (it ends in `.git`).
2. **Open Terminal** (Mac) or **Git Bash / Command Prompt** (Windows).
3. **Go to the folder where you want the project**, for example:
```
   cd ~/Documents
```
4. **Run the clone command**, pasting in the URL you copied:
```
   git clone https://github.com/organization/repo-name.git
```
5. **Open the project folder:**
```
   cd repo-name
```

### Good to know

- You only need to clone a repo **once**. After that, use **"Fetch origin"** / **"Pull"** in GitHub Desktop (or `git pull` in the terminal) to get the latest changes.
- If you can't see the repo or get a permission error, ask the repo owner to add you as a collaborator.

---

## Troubleshooting: Authentication Errors

If you see an error like **"Authentication failed,"** **"Permission denied,"** or **"Repository not found"** when cloning, try these fixes in order.

**1. Make sure you have access to the repo.**
For private repositories, GitHub shows "Repository not found" if you don't have permission, even when the URL is correct. Check that you can open the repo page in your browser while signed in. If you can't, ask the repo owner to add you as a collaborator, then accept the invitation from your email or from [github.com/notifications](https://github.com/notifications).

**2. If you're using GitHub Desktop, sign out and back in.**
Go to **GitHub Desktop → Settings → Accounts** (Mac) or **File → Options → Accounts** (Windows), click **Sign out**, then sign back in. This refreshes your login and fixes most errors.

**3. If you're using the terminal, don't use your GitHub password.**
GitHub no longer accepts account passwords for the command line. When the terminal asks for a password, you need a **personal access token** instead. The easiest fix is to install the [GitHub CLI](https://cli.github.com) and run:
```
gh auth login
```
Follow the prompts (choose **GitHub.com**, **HTTPS**, and **Login with a web browser**). After that, `git clone` will work without asking for a password.

If you'd rather create a token manually: go to **GitHub → Settings → Developer settings → Personal access tokens**, generate a token with **repo** access, and paste it in when the terminal asks for your password.

**4. If your company uses single sign-on (SSO), authorize your login.**
Some organizations require an extra step. If the error mentions SSO, go to **GitHub → Settings → Applications** (for GitHub Desktop) or your token settings, and click **Configure SSO / Authorize** next to your organization.

**5. Clear an old saved login.**
Your computer may be remembering outdated credentials.
- **Mac:** Open **Keychain Access**, search for `github.com`, and delete the entry. Then try cloning again.
- **Windows:** Open **Credential Manager → Windows Credentials**, find the `git:https://github.com` entry, and remove it.

**Still stuck?** Copy the exact error message and send it to Slack so someone can help.

---

## How to Work in Your Own Branch and Share with Others

A **branch** is your own working copy of the project. You can make changes there without affecting anyone else's work. When you're ready, you share your branch and ask for it to be merged into the main project.

### 1. Start from the latest version

Before creating a branch, make sure you have the newest files.

1. Open GitHub Desktop and check that the correct repository is selected in the top-left **Current Repository** menu.
2. In the **Current Branch** menu, select `main`.
3. Click **Fetch origin**. If it changes to **Pull origin**, click it to download the latest changes.

### 2. Create your branch

1. Click the **Current Branch** menu and choose **New Branch**.
2. Give it a short, descriptive name using dashes instead of spaces, like `update-homepage-icons` or `jane/button-styles`.
3. Make sure it's based on `main`, then click **Create Branch**.

You're now working in your own branch. Any changes you make stay here until you share them.

### 3. Make your changes

Edit, add, or replace files in the project folder as you normally would (click **Show in Finder** or **Show in Explorer** to open it). GitHub Desktop automatically detects your changes and lists them in the **Changes** tab on the left.

### 4. Save your work with a commit

A **commit** is a saved checkpoint of your changes.

1. In the **Changes** tab, review the list of files. Uncheck any you don't want to include.
2. At the bottom left, write a short **Summary** describing what you changed, like `Update homepage icons to new style`.
3. Click **Commit to [your-branch-name]**.

It's fine to commit often. Small, frequent commits make it easier to track and undo changes.

### 5. Share your branch

1. Click **Publish branch** at the top. This uploads your branch to GitHub so others can see it.
2. After the first publish, the button changes to **Push origin**. Click it whenever you commit new changes so GitHub stays up to date.

### 6. Ask for a review with a pull request

> [!NOTE]  
> Not all pull requests are intended to be merged. You can create a pull request to only show options or review changes.

A **pull request** asks your team to review your changes and potentially merge them into `main`.

1. Click **Preview Pull Request** (or **Branch → Create Pull Request**). This opens GitHub in your browser.
2. Add a title and a short description of what you changed and why. Screenshots are very helpful here.
3. On the right, add **Reviewers** if your team asks you to.
4. Click **Create pull request**.

Your teammates can now leave comments. If they ask for changes, just edit the files, commit, and click **Push origin** again. The pull request updates automatically.

### 7. After your changes are merged

Once your pull request is approved and merged:

1. In GitHub Desktop, switch back to `main` using the **Current Branch** menu.
2. Click **Fetch origin**, then **Pull origin** to get the updated project.
3. Create a new branch for your next task (start again from step 1).

### Good to know

- **Always check which branch you're on** before making changes. The current branch is shown at the top of GitHub Desktop.
- **Switching branches with unsaved changes:** GitHub Desktop will ask whether to bring your changes along or leave them on the current branch. If you're unsure, commit your work first.
- **Getting updates from `main` while you work:** Choose **Branch → Update from main** to pull in your teammates' latest changes without leaving your branch.
- **Don't commit directly to `main`.** Always work in your own branch so your changes can be reviewed first.