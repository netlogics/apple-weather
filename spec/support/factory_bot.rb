#!/usr/bin/env ruby

FactoryBot::SyntaxRunner.instance_eval do
  include ActionDispatch::TestProcess::FixtureFile
  def fixture_path
    File.absolute_path(Rails.root.join('spec/fixtures/files'))
  end
  # Optional: Silence a potential warning about file_fixture_path not being defined
  def file_fixture_path
    fixture_path
  end
end
