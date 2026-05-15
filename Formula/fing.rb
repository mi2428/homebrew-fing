# typed: false
# frozen_string_literal: true

class Fing < Formula
  desc "Local IPv4 network scanner with device fingerprints"
  homepage "https://github.com/mi2428/fing"
  version "0.9.2"
  license "MIT"
  depends_on :macos

  on_macos do
    on_arm do
      url "https://github.com/mi2428/fing/releases/download/v0.9.2/fing-v0.9.2-darwin-arm64",
          using: :nounzip
      sha256 "31410e0dc2d5cdead4dde0f24268b511ff642a82876ec30675ac932ad82a2eb0"
    end

    on_intel do
      url "https://github.com/mi2428/fing/releases/download/v0.9.2/fing-v0.9.2-darwin-amd64",
          using: :nounzip
      sha256 "3858609ae58abcfb10438b354a0eb0a940035a1112d7212abcb2da3933711fda"
    end
  end

  def install
    bin.install Dir["fing-v#{version}-darwin-*"].first => "fing"
    chmod 0755, bin/"fing"
  end

  test do
    assert_match "fing #{version}", shell_output("#{bin}/fing --version")
    assert_match "Usage:", shell_output("#{bin}/fing --help")
  end
end
