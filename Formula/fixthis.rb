class Fixthis < Formula
  desc "Agent-first feedback handoff for Jetpack Compose Android apps"
  homepage "https://github.com/beyondwin/FixThis"
  url "https://github.com/beyondwin/FixThis/releases/download/v0.6.0/fixthis-cli-mcp-v0.6.0.tar.gz"
  sha256 "de890fae91f637607e02898aa439ab840fcb05496d1700555d096ec86e3dd312"
  license "MIT"

  depends_on "openjdk@21"

  def install
    libexec.install Dir["*"]
    java_home = Formula["openjdk@21"].opt_prefix
    (bin/"fixthis").write_env_script libexec/"fixthis/bin/fixthis", JAVA_HOME: java_home
    (bin/"fixthis-mcp").write_env_script libexec/"fixthis-mcp/bin/fixthis-mcp", JAVA_HOME: java_home
  end

  test do
    assert_match "Usage", shell_output("#{bin}/fixthis --help")
    assert_predicate bin/"fixthis-mcp", :executable?
  end
end
