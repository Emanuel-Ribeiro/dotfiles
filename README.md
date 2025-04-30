# Environment Setup

## 🚀 Getting Started

1. **Install all tools and packages**  
   Run the following command to install everything configured for your environment:

   **On Fedora:**
   ```
   fedora-run
   ```

   **On macOS:**
   ```
   mac-run
   ```

   **On popOS:**
   ```
   pop-run
   ```

2. **Apply your dotfiles**  
   After installation, apply your environment configuration with:

   **On Fedora:**
   ```
   fedora-env
   ```

   **On macOS:**
   ```
   mac-env
   ```

   **On popOS**
   ```
   pop-env
   ```

## 🔍 Filtered Installation

You can choose to install only specific components by passing them as arguments.  
For example, to install only neovim:

**On Fedora:**
```
fedora-run neovim
```

**On macOS:**
```
mac-run neovim
```

**On popOS:**
```
pop-run neovim
```

## 🧪 Dry Run (Plan Mode)

Preview what will be installed or configured before actually running it:

**On Fedora:**
```
fedora-run plan
fedora-env plan
```

**On macOS:**
```
mac-run plan
mac-env plan
```

**On popOS:**
```
pop-run plan
pop-env plan
```

This works with filters as well:

**Examples:**

**On Fedora:**
```
fedora-run nvim plan
```

**On macOS:**
```
mac-run nvim plan
```

**On popOS:**
```
pop-run nvim plan
```

