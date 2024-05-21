require_relative '../balanced'

RSpec.describe Bracet do
    let(:bracet) { Bracet.new }
  
    describe '()' do
        it '#1' do
            expect(bracet.balanced_brackets?('(())')).to be_truthy
        end
        it '#2' do
            expect(bracet.balanced_brackets?('()')).to be_truthy
        end
        it '#3' do
            expect(bracet.balanced_brackets?(')(')).to be_falsey
        end
        it '#4' do
            expect(bracet.balanced_brackets?('((())')).to be_falsey
        end
        it '#5' do
            expect(bracet.balanced_brackets?('')).to be_truthy
        end
        it '#6' do
            expect(bracet.balanced_brackets?('((()))')).to be_truthy
        end
    end

    describe '{}' do
        it '#1' do
            expect(bracet.balanced_brackets?('{}')).to be_truthy
        end
        it '#2' do
            expect(bracet.balanced_brackets?('{{}}')).to be_truthy
        end
        it '#3' do
            expect(bracet.balanced_brackets?('{{}')).to be_falsey
        end
        it '#4' do
            expect(bracet.balanced_brackets?('{}}')).to be_falsey
        end
        it '#5' do
            expect(bracet.balanced_brackets?('{')).to be_falsey
        end
        it '#6' do
            expect(bracet.balanced_brackets?('')).to be_truthy
        end
    end

    describe '[]' do
        it '#1' do
            expect(bracet.balanced_brackets?('[]')).to be_truthy
        end
        it '#2' do
            expect(bracet.balanced_brackets?('[[]]')).to be_truthy
        end
        it '#3' do
            expect(bracet.balanced_brackets?('[[')).to be_falsey
        end
        it '#4' do
            expect(bracet.balanced_brackets?('[]]')).to be_falsey
        end
        it '#5' do
            expect(bracet.balanced_brackets?('[')).to be_falsey
        end
        it '#6' do
            expect(bracet.balanced_brackets?('')).to be_truthy
        end
    end
  end
  