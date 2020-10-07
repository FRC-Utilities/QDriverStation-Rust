<a href="#">
    <img src="artwork/icon.png" align="right" />
</a>

# QDriverStation

The QDriverStation is a cross-platform and open-source alternative to the FRC Driver Station. It allows you to operate FRC robots with the major operating systems (Windows, macOS and GNU/Linux). 

The actual code that operates a FRC robot is found in a separate repository ([ds-rs](https://github.com/first-rust-competition/ds-rs)) and is written in Rust by [Kaitlyn Kenwell](https://github.com/Redrield).

For the moment, this project is under heavy development. The user interface will be built from the ground-up to use newer Qt/QML technologies. Integration with [ds-rs](https://github.com/first-rust-competition/ds-rs) is underway.

### Cloning this repo

This repository makes use of [`git submodule`](https://git-scm.com/docs/git-submodule). In order to clone it, you have two options:

#### a) One-liner

    git clone --recursive https://github.com/FRC-Utilities/QDriverStation/

#### b) Normal procedure

    git clone https://github.com/FRC-Utilities/QDriverStation/
    cd QDriverStation
    git submodule init
    git submodule update

### Note

This version of the QDriverStation only works with 2020 robots. If you need to drive an older robot, check the [legacy](https://github.com/FRC-Utilites/QDriverStation-Legacy) version.

### License

This project is released under the MIT License. For more information, [click here](LICENSE.md).
