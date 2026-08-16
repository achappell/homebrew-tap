# typed: false
# frozen_string_literal: true

class Openusage < Formula
  desc "Monitor your AI coding tool quotas from a single TUI dashboard"
  homepage "https://openusage.sh"
  version "0.26.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/achappell/openusage/releases/download/v0.26.0/openusage_0.26.0_darwin_arm64.tar.gz"
      sha256 "cfc74502b48a26e08ee039a78c84ce4dc0ddfad91d5d5bf99c141d73021d7c07"
    else
      url "https://github.com/achappell/openusage/releases/download/v0.26.0/openusage_0.26.0_darwin_amd64.tar.gz"
      sha256 "85f5df6e867c9509c11e26b66343173f908f9aadb3537d28b3a192ae64ded5e3"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/achappell/openusage/releases/download/v0.26.0/openusage_0.26.0_linux_arm64.tar.gz"
      sha256 "fcc60e80cb97b398bbf55247e7d5400ee347eaa4b21a5da93db8aa1f62c15432"
    else
      url "https://github.com/achappell/openusage/releases/download/v0.26.0/openusage_0.26.0_linux_amd64.tar.gz"
      sha256 "14d0a9ff8f628ed358953a36d1120095b9a4ae1f964e85f118e8a05be04aeb2f"
    end
  end

  def install
    bin.install "openusage"
  end

  def caveats
    <<~EOS
      If `openusage` is missing after an install or upgrade, the keg is
      installed but unlinked. There are two known causes.

      1. Tap trust. Homebrew 6.0+ requires third-party taps to be trusted,
         and a trust grant only covers the formula version it was made for,
         so each `brew update` that bumps openusage can leave the keg
         unlinked. Trust the whole tap once to keep it linked across
         upgrades:

 brew trust achappell/tap

         See https://docs.brew.sh/Tap-Trust for details.

      2. Tap ambiguity. If another installed tap also defines a formula
         named "openusage", Homebrew cannot resolve the bare name and
         skips the link step. Check with:

 brew info --formula openusage

         An error reading "Formulae found in multiple taps" confirms it.
         Remove the tap you do not use, or always use the fully-qualified
         name.

      Either way, this restores the command immediately:

        brew link achappell/tap/openusage
    EOS
  end

  test do
    assert_match "openusage", shell_output("#{bin}/openusage --version 2>&1", 0)
  end
end
