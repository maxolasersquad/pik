
describe Pik::BashFile do

  before do
    @bf = Pik::BashFile.new('pik')
  end

	it "should have the correct file name" do
		@bf.path.to_s.should == 'pik.sh'

    bf2 = Pik::BashFile.new('pik.sh')
    bf2.path.to_s.should == 'pik.sh'
	end

	it "should have a header" do
		string =  "#!/bin/sh\n#  This bash script generated by Pik, the\n#  Ruby Manager for Windows\n" 
		@bf.to_s.should == string	
	end

  it "should generate a path command with the updated ruby path" do
		@bf.set('PATH' => Pathname("C:\\ruby\\191\\bin")).to_s.should match(/export PATH\='\/c\/ruby\/191\/bin'/)
    @bf.set('GEM_HOME' => nil).to_s.should match(/unset GEM_HOME/)
	end

  it "should echo a string given" do 
    @bf.echo("Hello World").to_s.should match(/ECHO Hello World/)
  end

  it "should call the command given" do 
    @bf.call('pik.bat').to_s.should match(/pik\.bat/)
  end
	
end