#Severity: Medium
#The "/etc/gshadow" file contains group password hashes. Protection of this
#file is critical for system security.

control 'v-38443-gshadow' do
  impact 0.5
  title 'v-38443: verify gshadow is owned by root'
  describe file('/etc/gshadow') do
    it { should be_owned_by 'root' }
  end
end

