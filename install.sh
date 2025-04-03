#!/bin/bash

# Colors
GREEN='\033[0;32m'
BLUE='\033[0;34m'
RED='\033[0;31m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Print banner
echo -e "${BLUE}"
echo "███╗   ██╗███████╗ ██████╗  ██████╗ ██████╗ ██████╗ ███████╗██████╗ "
echo "████╗  ██║██╔════╝██╔═══██╗██╔════╝██╔═══██╗██╔══██╗██╔════╝██╔══██╗"
echo "██╔██╗ ██║█████╗  ██║   ██║██║     ██║   ██║██║  ██║█████╗  ██████╔╝"
echo "██║╚██╗██║██╔══╝  ██║   ██║██║     ██║   ██║██║  ██║██╔══╝  ██╔══██╗"
echo "██║ ╚████║███████╗╚██████╔╝╚██████╗╚██████╔╝██████╔╝███████╗██║  ██║"
echo "╚═╝  ╚═══╝╚══════╝ ╚═════╝  ╚═════╝ ╚═════╝ ╚═════╝ ╚══════╝╚═╝  ╚═╝"
echo -e "${NC}"
echo -e "${GREEN}Welcome to Neovim Configuration Installation${NC}"
echo

# Check if Neovim is installed
if ! command -v nvim &> /dev/null; then
    echo -e "${RED}Neovim not found. Please install Neovim (version 0.8.0 or later) first.${NC}"
    exit 1
fi

# Check Neovim version
NVIM_VERSION=$(nvim --version | head -n 1 | cut -d ' ' -f 2)
if [[ $(echo "$NVIM_VERSION" | cut -d '.' -f 2) -lt 8 ]]; then
    echo -e "${RED}Your Neovim version is $NVIM_VERSION, but version 0.8.0 or later is required.${NC}"
    exit 1
fi

echo -e "${BLUE}Neovim version $NVIM_VERSION detected. ✓${NC}"

# Check for required dependencies
echo -e "${BLUE}Checking for required dependencies...${NC}"

MISSING_DEPS=0

# Check for git
if ! command -v git &> /dev/null; then
    echo -e "${RED}Git is not installed. Please install Git.${NC}"
    MISSING_DEPS=1
fi

# Check for ripgrep (optional but recommended)
if ! command -v rg &> /dev/null; then
    echo -e "${YELLOW}Warning: ripgrep (rg) is not installed. It's recommended for better search functionality.${NC}"
fi

# Check for node and npm (required for many LSPs)
if ! command -v node &> /dev/null; then
    echo -e "${YELLOW}Warning: Node.js is not installed. It's required for many language servers.${NC}"
fi

if [ $MISSING_DEPS -eq 1 ]; then
    echo -e "${RED}Please install missing dependencies before continuing.${NC}"
    exit 1
fi

# Backup existing Neovim configuration if it exists
NVIM_CONFIG_DIR="${XDG_CONFIG_HOME:-$HOME/.config}/nvim"
BACKUP_DIR="${NVIM_CONFIG_DIR}.bak.$(date +%Y%m%d%H%M%S)"

if [ -d "$NVIM_CONFIG_DIR" ] && [ "$(ls -A "$NVIM_CONFIG_DIR")" ]; then
    echo -e "${YELLOW}Backing up existing Neovim configuration to $BACKUP_DIR${NC}"
    mv "$NVIM_CONFIG_DIR" "$BACKUP_DIR"
fi

# Create Neovim config directory
mkdir -p "$NVIM_CONFIG_DIR"
mkdir -p "$NVIM_CONFIG_DIR/lua"

# Copy configuration files
echo -e "${GREEN}Installing Neovim configuration...${NC}"
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

# Copy init.lua to the root of the config directory
echo -e "${GREEN}Copying configuration files to $NVIM_CONFIG_DIR...${NC}"
cp -r "$SCRIPT_DIR/init.lua" "$NVIM_CONFIG_DIR/"

# Copy lua files
cp -r "$SCRIPT_DIR/lua/config" "$NVIM_CONFIG_DIR/lua/"
cp -r "$SCRIPT_DIR/lua/plugins" "$NVIM_CONFIG_DIR/lua/"

# Install lazy.nvim if not already installed
LAZY_DIR="${XDG_DATA_HOME:-$HOME/.local/share}/nvim/lazy/lazy.nvim"
if [ ! -d "$LAZY_DIR" ]; then
    echo -e "${BLUE}Installing lazy.nvim...${NC}"
    mkdir -p "$(dirname "$LAZY_DIR")"
    git clone --filter=blob:none https://github.com/folke/lazy.nvim.git --branch=stable "$LAZY_DIR"
fi

echo -e "${GREEN}Installation completed successfully!${NC}"
echo
echo -e "${BLUE}To finalize the installation, please run:${NC}"
echo -e "${YELLOW}nvim${NC}"
echo
echo -e "${BLUE}On first start, Neovim will:${NC}"
echo -e "- Install all required plugins"
echo -e "- Set up your development environment"
echo
echo -e "${GREEN}Enjoy your new Neovim configuration!${NC}" 