class ClaudeProfile < Formula
  desc "Switch between Claude Code configuration profiles"
  homepage "https://github.com/yarikleto/claude-profile"
  url "https://github.com/yarikleto/claude-profile/archive/refs/tags/v2.0.4.tar.gz"
  sha256 "b9e8e38f5cdebfddf286425ca96dbe1b0e3b9e438ca08ea9b53b17ce191dbc5c"
  license "MIT"

  depends_on "bash"

  def install
    libexec.install "lib", "commands", "VERSION"
    bin.install "claude-profile"
    inreplace bin/"claude-profile",
      /^SCRIPT_DIR=.*/, "SCRIPT_DIR=\"#{libexec}\""
    zsh_completion.install "completions/claude-profile.zsh" => "_claude-profile"
    bash_completion.install "completions/claude-profile.bash" => "claude-profile"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/claude-profile version")
  end
end
