require 'spec_helper'

describe DeprecatedColumns do
  def message_for(table_name, column_name)
    # ActiveRecord::Migration wraps `say_with_time` around all method calls,
    # but we don't want that output in test-mode.
    silence_stream $stdout do
      ActiveRecord::Migration.new.column_deprecation_status(table_name, column_name)
    end
  end

  it 'has a version number' do
    expect(DeprecatedColumns::VERSION).not_to be nil
  end

  context 'when a model declares `deprecated_columns`' do
    subject { message_for(:with_deprecation, :title) }

    it 'confirms the column was deprecated' do
      expect(subject).to start_with('OK: with_deprecation.title has been deprecated.')
    end
  end

  context 'when a model does not declare `deprecated_columns`' do
    subject { message_for(:without_deprecation, :title) }

    it 'warns the column was not deprecated' do
      expect(subject).to start_with('WARNING: without_deprecation.title has not been deprecated.')
    end
  end

  context 'for a non-existent table/model' do
    subject { message_for(:whoops, :doh) }

    it 'warns the model does not exist' do
      expect(subject).to start_with("WARNING: Couldn't find model for table whoops.")
    end
  end
end
