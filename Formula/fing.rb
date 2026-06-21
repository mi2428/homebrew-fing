# typed: false
# frozen_string_literal: true

class Fing < Formula
  desc "Local IPv4 network scanner with device fingerprints"
  homepage "https://github.com/mi2428/fing"
  version "0.12.2"
  license "MIT"
  depends_on :macos

  on_macos do
    on_arm do
      url "https://github.com/mi2428/fing/releases/download/v0.12.2/fing-v0.12.2-darwin-arm64",
          using: :nounzip
      sha256 "71efffd393d9883b2d7608ef971983c958f3f0f9ecdb0ed111a476358d0da9fa"
    end

    on_intel do
      url "https://github.com/mi2428/fing/releases/download/v0.12.2/fing-v0.12.2-darwin-amd64",
          using: :nounzip
      sha256 "caf23d4384e578a7f5d5d07605bae686a01d1d56e7213db60d7ef6dc484b5795"
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
