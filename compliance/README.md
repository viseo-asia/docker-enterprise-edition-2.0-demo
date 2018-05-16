## Inspec - Compliance as Code

1. Install inspec from here: [https://downloads.chef.io/inspec#ubuntu](https://downloads.chef.io/inspec#ubuntu)

2. Configure SSH for passwordless login
    - `vagrant ssh-config >> ~/.ssh/config`
    - Edit the ssh/config file
    - `vi + ~/.ssh/config`
    - Change `Host default` to `Host dockeree`

3. Run the tests
    - `cd compliance`
    - `inspec exec v-38443-gshadow -t ssh://vagrant@dockeree:2222`

Example output:

```
❯ inspec exec v-38443-gshadow -t ssh://vagrant@dockeree:2222

Profile: InSpec Profile (v-38443-gshadow)
Version: 0.1.0
Target:  ssh://vagrant@dockeree:2222

  ✔  v-38443-gshadow: v-38443: verify gshadow is owned by root
     ✔  File /etc/gshadow should be owned by "root"


Profile Summary: 1 successful control, 0 control failures, 0 controls skipped
Test Summary: 1 successful, 0 failures, 0 skipped
```

