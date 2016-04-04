require "spec_helper_#{ENV['SPEC_TARGET_BACKEND']}"

describe package('openssh-server'), :if => ['debian'].include?(os[:family]) do
  it { should be_installed }
end

describe package('openssh'), :if => ['alpine'].include?(os[:family]) do
  it { should be_installed }
end

describe command('which sshd') do
  its(:exit_status) { should eq 0 }
end
