#!/usr/bin/env bash
# Arma el tema Estampa descargando Dawn y aplicando las customizaciones.
# Uso: bash setup.sh

set -e

echo "==> Descargando Dawn (tema base de Shopify)..."
if [ -d "dawn" ]; then
  echo "    ya existe carpeta 'dawn/', salteando clonado"
else
  git clone --depth 1 https://github.com/Shopify/dawn.git dawn
fi

echo "==> Aplicando customizaciones de Estampa..."
cp -v customizations/config/settings_data.json     dawn/config/settings_data.json
cp -v customizations/templates/index.json          dawn/templates/index.json
cp -v customizations/templates/page.contact.json   dawn/templates/page.contact.json
cp -v customizations/sections/header-group.json    dawn/sections/header-group.json
cp -v customizations/sections/footer-group.json    dawn/sections/footer-group.json
cp -v customizations/assets/logo.svg               dawn/assets/logo.svg

echo ""
echo "Listo. Tu tema está en la carpeta 'dawn/'."
echo ""
echo "Próximos pasos:"
echo "  1. cd dawn"
echo "  2. npm install -g @shopify/cli @shopify/theme   (una sola vez)"
echo "  3. shopify theme dev --store TU-TIENDA.myshopify.com"
