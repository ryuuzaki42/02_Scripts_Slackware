#!/bin/bash
#
# Autor= João Batista Ribeiro
# Bugs, Agradecimentos, Críticas "construtivas"
# Mande me um e-mail. Ficarei Grato!
# e-mail: joao42lbatista@gmail.com
#
# Este programa é um software livre; você pode redistribui-lo e/ou
# modifica-lo dentro dos termos da Licença Pública Geral GNU como
# publicada pela Fundação do Software Livre (FSF); na versão 2 da
# Licença, ou (na sua opinião) qualquer versão.
#
# Este programa é distribuído na esperança que possa ser útil,
# mas SEM NENHUMA GARANTIA; sem uma garantia implícita de ADEQUAÇÃO a
# qualquer MERCADO ou APLICAÇÃO EM PARTICULAR.
#
# Veja a Licença Pública Geral GNU para mais detalhes.
# Você deve ter recebido uma cópia da Licença Pública Geral GNU
# junto com este programa, se não, escreva para a Fundação do Software
#
# Livre(FSF) Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301 USA
#
# Script: Run a AppImage using local configuration (place of the AppImage file)
# Create to folders to save the configuration files
#
# Last update: 24/03/2024
#
AppImage_File=$1
if [ "$AppImage_File" == '' ]; then
    echo -e "\n# Error: Need to pass parameters - the AppImage file name"
    echo -e "For help message: $0 -h\n"
    exit 1
fi

if [ "$AppImage_File" == '-h' ]; then
    echo -e "\n Run an AppImage using local configuration (place of the AppImage file)"
    echo " Will create folders to save the configuration files, *.AppImage.config/ *.AppImage.home/"
    echo " OBS.: The application in the AppImage may save files in other folder, like home user folder"
    echo -e "\n    Example: $0 Calibre-*-x86_64-1_JB.AppImage\n"

    exit 0
fi

other_parameters=${*:2} # Parameters from $2 onwards
echo "AppImage_File: $AppImage_File $other_parameters"

# Add permission to run, may not have it yet
chmod +x $AppImage_File

# Create a portable home folder to use as $HOME
./$AppImage_File --appimage-portable-home

# Create a portable config folder to use as $XDG_CONFIG_HOME
./$AppImage_File --appimage-portable-config

./$AppImage_File $other_parameters
