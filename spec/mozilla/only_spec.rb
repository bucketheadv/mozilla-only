require 'spec_helper'

describe Mozilla::Only do
  it 'has a version number' do
    expect(Mozilla::Only::VERSION).not_to be nil
  end

  it 'does something useful' do
    expect(true).to eq(true)
  end

  describe "when firefox" do
    it "should have the response code 400" do
      env = { "HTTP_USER_AGENT" => "Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:48.0) Gecko/20100101 Firefox/48.0 " }
      header = {}
      client = Mozilla::Only::Client.new(proc { [200, header, ["This is body."]] })
      expect(client.call(env)).to eq [400, header, ["Bad Request"]]
    end
  end

  describe "when google chorme" do
    it "should have the response code 200" do
      env = { "HTTP_USER_AGENT" => "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.103 Safari/537.36" }
      code = 200
      header = {}
      body = ["This is body."]
      client = Mozilla::Only::Client.new(proc { [code, header, body]})
      expect(client.call(env)).to eq [code, header, body]
    end
  end
end
