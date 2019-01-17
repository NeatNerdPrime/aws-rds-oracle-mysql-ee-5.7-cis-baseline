control "3.8" do
  title "Ensure Plugin Directory Has Appropriate Permissions and Ownership (Scored)"
  desc  "The plugin directory is the location of the MySQL plugins. 
  Plugins are storage engines or user defined functions (UDFs)"
  impact 0.5
  tag "severity": "medium"
  tag "cis_id": "3.8"
  tag "cis_level": 1
  tag "Profile Applicability": "Level 1 - MySQL RDBMS on Linux"
  tag "audit text": "To assess this recommendation, execute the following SQL statement to discover the Value of plugin_dir:
  show variables where variable_name = 'plugin_dir';

  Then, execute the following command at a terminal prompt (using the discovered plugin_dir Value) to determine the permissions and ownership.
    ls -l <plugin_dir Value>/.. | egrep '^drwxr[-w]xr[-w]x[ \t]*[0-9][ \t]*mysql[ \t]*mysql.*plugin.*$'
  Lack of output implies a finding.
  NOTE: Permissions are intended to be either 775 or 755"
  tag "fix": "To remediate these settings, execute the following commands at a terminal prompt using the plugin_dir Value from the audit procedure.
    chmod 775 <plugin_dir Value> (or use 755) 
    chown mysql:mysql <plugin_dir Value>"
  impact 0.0
  describe 'This control is not applicable on mysql within aws rds, as aws manages the operating system in which the mysql database is running on' do
    skip 'This control is not applicable on mysql within aws rds, as aws manages the operating system in which the mysql database is running on'
  end
end
