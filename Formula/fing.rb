# typed: false
# frozen_string_literal: true

class Fing < Formula
  desc "Local IPv4 network scanner with device fingerprints"
  homepage "https://github.com/mi2428/fing"
  version "0.11.0"
  license "MIT"
  depends_on :macos

  on_macos do
    on_arm do
      url "https://github.com/mi2428/fing/releases/download/v0.11.0/fing-v0.11.0-darwin-arm64",
          using: :nounzip
      sha256 "12ef70b787c76b795e170241bfa6de271935978e3a2a5f2e56bbaee1c4b202c8"
    end

    on_intel do
      url "https://github.com/mi2428/fing/releases/download/v0.11.0/fing-v0.11.0-darwin-amd64",
          using: :nounzip
      sha256 "4f9098c35faeb3dcd00f58fbe775d45459a46b190290197541625701ce8129a8"
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
