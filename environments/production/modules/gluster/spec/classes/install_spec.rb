require 'spec_helper'

describe 'gluster::install', type: :class do
  on_supported_os.each do |os, facts|
    context "on #{os}" do
      let :facts do
        facts
      end
      let :pre_condition do
        'require ::gluster::service'
      end
      context 'with defaults' do
        it { is_expected.to compile.with_all_deps }
        case facts[:osfamily]
        when 'Redhat'
          # rubocop:disable RSpec/RepeatedExample
          it { is_expected.to create_package('glusterfs-server') }
          it { is_expected.to create_package('glusterfs-fuse') }
          it { is_expected.to create_class('gluster::repo').with(version: 'LATEST') }
        when 'Debian'
          it { is_expected.to create_package('glusterfs-server') }
          it { is_expected.to create_package('glusterfs-client') }
          it { is_expected.to create_class('gluster::repo').with(version: 'LATEST') }
          # rubocop:enable RSpec/RepeatedExample
        end
      end
      context 'when repo is false' do
        let :params do
          { repo: false }
        end
        it { is_expected.not_to create_class('gluster::repo') }
      end
      context 'when client is false' do
        let :params do
          { client: false }
        end
        case facts[:osfamily]
        when 'Redhat'
          it { is_expected.not_to create_package('glusterfs-fuse') }
        when 'Debian'
          it { is_expected.not_to create_package('glusterfs-client') }
        end
      end
      context 'when server is false' do
        let :params do
          { server: false }
        end
        case facts[:osfamily]
        when 'Redhat', 'Debian'
          it { is_expected.not_to create_package('glusterfs-server') }
        end
      end
      context 'installing on an unsupported architecture' do
        let :facts do
          super().merge(
            architecture: 'zLinux'
          )
        end
        case facts[:osfamily]
        when 'Archlinux'
          it { is_expected.not_to create_class('gluster::repo') }
        else
          it { is_expected.to raise_error(Puppet::Error, %r{not yet supported}) }
        end
      end
    end
  end
end
