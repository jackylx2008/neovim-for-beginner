# neovim-for-beginner

Companion code for the [Medium Neovim for Beginners series.](https://alpha2phi.medium.com/learn-neovim-the-practical-way-8818fcf4830f#545a)

```shell
# Possibly optional.
ln -s /usr/local/bin/python3 /usr/local/bin/python

# Start from scratch.
rm -rf ~/.cache/nvim

nvim
:lua vim.fn.setenv("MACOSX_DEPLOYMENT_TARGET", "10.15")
:PackerSync
:qa!

# If the above fails, install manually:
export MACOSX_DEPLOYMENT_TARGET=10.15
cd ~/.cache/nvim/packer_hererocks
rm -rf 2.1.0-beta3
python3 hererocks.py -j "2.1.0-beta3" "2.1.0-beta3"

# Reattempt:
nvim
:PackerSync
:qa!
```
