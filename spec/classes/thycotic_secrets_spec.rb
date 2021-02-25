require 'spec_helper'

on_supported_os.each do |os, os_facts|
  describe 'thycotic_tss::tss' do
    context "for TSS on #{os}" do
      let(:facts) { os_facts }
      let(:pre_condition) { 'include thycotic_tss' }
      let(:params) do
        {
          username: ENV['USERNAME'],
          password: ENV['PASSWORD'],
          server_url: ENV['SERVER_URL'],
          secret_id: ENV['SECRET_ID'],
        }
      end

      it { is_expected.to compile }
    end
  end
end
