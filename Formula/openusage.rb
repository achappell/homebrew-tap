# typed: false
# frozen_string_literal: true

class Openusage < Formula
  desc "Monitor your AI coding tool quotas from a single TUI dashboard"
  homepage "https://openusage.sh"
  version "0.24.4"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/achappell/openusage/releases/download/v0.24.4/openusage_0.24.4_darwin_arm64.tar.gz"
      sha256 "3add926d06eb89f11f7acbfeb8f8e9b9b5eaa66cc1e1e019184502864f65ac2f"
    else
      url "https://github.com/achappell/openusage/releases/download/v0.24.4/openusage_0.24.4_darwin_amd64.tar.gz"
      sha256 "15577932bf0389876b2ad9221cf7ee35a03b618268ccdcb95f30e61cb400e775"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/achappell/openusage/releases/download/v0.24.4/openusage_0.24.4_linux_arm64.tar.gz"
      sha256 "f41e1a691fc2590af921e76d3f08cb81474570d25e0dcfd1b34ab6484ca2890b"
    else
      url "https://github.com/achappell/openusage/releases/download/v0.24.4/openusage_0.24.4_linux_amd64.tar.gz"
      sha256 "040c0aaf8a3209f7fc1916f8fcb48735141f2d226ac15893cea0c371122003b2"
    end
  end

  def install
    bin.install "openusage"
  end

  def caveats
    <<~EOS
      Homebrew 6.0+ requires third-party taps to be trusted. A trust grant
      only covers the formula version it was made for, so each `brew update`
      that bumps openusage can leave the keg installed-but-unlinked
      ("command not found" until you run `brew link`).

      Trust the whole tap once to keep openusage linked across upgrades:

        brew trust achappell/tap

      See https://docs.brew.sh/Tap-Trust for details.
    EOS
  end

  test do
    assert_match "openusage", shell_output("#{bin}/openusage --version 2>&1", 0)
  end
end
