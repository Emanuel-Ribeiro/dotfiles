# Fedora Environment Setup

## 🚀 Getting Started

1. **Install all tools and packages**  
   Run the following command to install everything configured for your Fedora environment:

   ```bash
   fedora-run
   ```

2. **Apply your dotfiles**  
   After installation, apply your environment configuration with:

   ```bash
   fedora-env
   ```

## 🔍 Filtered Installation

You can choose to install only specific components by passing them as arguments.  
For example, to install only [Ghostty](https://ghostty.io/):

```bash
fedora-run ghostty
```

## 🧪 Dry Run (Plan Mode)

Preview what will be installed or configured before actually running it:

```bash
fedora-run plan
fedora-env plan
```

This works with filters as well:

```bash
fedora-run ghostty plan
```

---

# Debian/Ubuntu Support

🚧 Coming soon

---

# macOS Support

🚧 Coming soon

