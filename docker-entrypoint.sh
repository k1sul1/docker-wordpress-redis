#!/bin/bash
set -euo pipefail

# Symlink wp-content
rm -rf /var/www/wp/wordpress/wp-content
ln -sf /var/www/wp/wp-content/ /var/www/wp/wordpress/wp-content

exec "$@"
