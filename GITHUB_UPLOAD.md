# Git Commands for First Upload

Follow these steps to upload your project to GitHub:

## 1. Initialize Git Repository

```bash
cd c:\tmp\microsrv
git init
```

## 2. Add All Files

```bash
git add .
```

## 3. Create Initial Commit

```bash
git commit -m "Initial commit: File Cleanup Manager v1.2.2"
```

## 4. Create GitHub Repository

1. Open https://github.com/new
2. Repository name: `file-cleanup-manager`
3. Description: `Automatic file cleanup service for Windows with Telegram notifications`
4. Choose: Public or Private
5. **Do NOT** initialize with README, .gitignore, or license (we already have them)
6. Click "Create repository"

## 5. Link to GitHub and Push

Replace `YOUR_USERNAME` with your GitHub username:

```bash
git remote add origin https://github.com/YOUR_USERNAME/file-cleanup-manager.git
git branch -M main
git push -u origin main
```

## 6. Add Release (Optional)

After pushing, you can create a release with the installer:

1. Go to your repository on GitHub
2. Click "Releases" → "Create a new release"
3. Tag version: `v1.2.2`
4. Release title: `File Cleanup Manager v1.2.2`
5. Upload `FileCleanupManagerSetup_v1.2.2.exe` from `csharp_version/Output/`
6. Add release notes about features
7. Click "Publish release"

## Useful Git Commands

```bash
# Check status
git status

# See what changed
git diff

# Add specific file
git add filename

# Commit changes
git commit -m "Your message"

# Push changes
git push
```
