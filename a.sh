printf "\033c"
RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color
echo "${GREEN}You should install some Gnome Shell Extensions here:${NC}"
echo "- ${RED}Dash to Dock: ${BLUE}https://extensions.gnome.org/extension/307/dash-to-dock/${NC}"
echo "- ${RED}AlternateTab: ${BLUE}https://extensions.gnome.org/extension/15/alternatetab/${NC}"
echo "- ${RED}Hide Activities Button: ${BLUE}https://extensions.gnome.org/extension/744/hide-activities-button/${NC}"
echo "${GREEN}Press any key to continue...${NC}"; read a
printf "\033c"