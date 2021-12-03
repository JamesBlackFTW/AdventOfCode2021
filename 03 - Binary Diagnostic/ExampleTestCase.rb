require './BinaryDiagnostic'

testcase = BinaryDiagnosticMachine.new(File.read('./testdata-example.txt'))
/testcase.solve_simple_diagnostic/
testcase.solve_advanced_diagnostic

