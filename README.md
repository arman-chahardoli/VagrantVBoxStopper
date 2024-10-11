# VagrantVBoxStopper

## Example

```
RUNNING MACHINES:
"my_vm_1"
"my_vm_2"

Which action on all Vagrant/VirtualBox machines?

    1) savestate (suspend)
    2) shutdown (soft)
    3) shutdown (force)
    4) reset

Other to exit

? 1
Are you sure ?(y/n) y
 - "my_vm_1"
 - "my_vm_2"

```
## Overview

VagrantVBoxStopper is a Bash script that simplifies stopping and finishing VMs managed by Vagrant and VirtualBox. It allows you to quickly shut down or suspend multiple VMs with ease.

## Benefits

- **Efficient Management**: Stop or finish all running VMs in one command.
- **Flexible Options**: Choose from soft shutdown, forced shutdown, or suspension.
- **User-Friendly**: Clear prompts guide you through the process.
- **Vagrant Integration**: Seamlessly manage Vagrant VMs with minimal effort.

## Installation

1. Clone the repository:

   ```bash
   git clone https://github.com/yourusername/VagrantVBoxStopper.git
   cd VagrantVBoxStopper
   ```
1. Running:

   ```bash
   . ./vagrant_vbox_stopper.sh
   ```
