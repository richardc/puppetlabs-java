require 'spec_helper'

describe 'java', :type => :class do

  context 'select openjdk for Centos 5.8' do
    let(:facts) { {:osfamily => 'RedHat', :operatingsystem => 'Centos', :operatingsystemrelease => '5.8'} }
    it { should contain_package('java').with_name('java-1.6.0-openjdk-devel') }
  end

  context 'select openjdk for Centos 6.3' do
    let(:facts) { {:osfamily => 'RedHat', :operatingsystem => 'Centos', :operatingsystemrelease => '6.3'} }
    it { should contain_package('java').with_name('java-1.7.0-openjdk-devel') }
  end

  context 'select openjdk for Centos 6.2' do
    let(:facts) { {:osfamily => 'RedHat', :operatingsystem => 'Centos', :operatingsystemrelease => '6.2'} }
    it { should contain_package('java').with_name('java-1.6.0-openjdk-devel') }
  end

  context 'select passed value for Centos 5.3' do
    let(:facts) { {:osfamily => 'RedHat', :operatingsystem => 'Centos', :operatingsystemrelease => '5.3'} }
    let(:params) { { 'package' => 'jdk' } }
    it { should contain_package('java').with_name('jdk') }
  end

  context 'select default for Centos 5.3' do
    let(:facts) { {:osfamily => 'RedHat', :operatingsystem => 'Centos', :operatingsystemrelease => '5.3'} }
    it { should contain_package('java').with_name('java-1.6.0-openjdk-devel') }
  end

  context 'select default for Debian Wheezy' do
    let(:facts) { {:osfamily => 'Debian', :operatingsystem => 'Debian', :lsbdistcodename => 'wheezy', :operatingsystemrelease => '7.1'} }
    it { should contain_package('java').with_name('openjdk-7-jdk') }
  end

  context 'select Oracle JRE for Debian Wheezy' do
    let(:facts) { {:osfamily => 'Debian', :operatingsystem => 'Debian', :lsbdistcodename => 'wheezy', :operatingsystemrelease => '7.1', :architecture => 'amd64', } }
    let(:params) { { 'distribution' => 'oracle-jre' } }
    it { should contain_package('java').with_name('oracle-j2re1.7') }
    it { should contain_exec('update-java-alternatives').with_command('update-java-alternatives --set j2re1.7-oracle --jre') }
    it { should contain_file('/tmp/test').with_content('Using package: oracle-j2re1.7, alterntative j2re1.7-oracle, alt_path /usr/lib/jvm/j2re1.7-oracle/bin/java') }
  end

  context 'select default for Debian Squeeze' do
    let(:facts) { {:osfamily => 'Debian', :operatingsystem => 'Debian', :lsbdistcodename => 'squeeze', :operatingsystemrelease => '6.0.5'} }
    it { should contain_package('java').with_name('openjdk-6-jdk') }
  end

  context 'select Oracle JRE for Debian Squeeze' do
    let(:facts) { {:osfamily => 'Debian', :operatingsystem => 'Debian', :lsbdistcodename => 'squeeze', :operatingsystemrelease => '6.0.5'} }
    let(:params) { { 'distribution' => 'sun-jre', } }
    it { should contain_package('java').with_name('sun-java6-jre') }
    it { should contain_exec('update-java-alternatives').with_command('update-java-alternatives --set java-6-sun --jre') }
  end
    it { should contain_file('/tmp/test').with_content('Using package: sun-java6-jre, alterntative java-6-sun, alt_path /usr/lib/jvm/java-6-sun/jre/bin/java') }
  end
end
