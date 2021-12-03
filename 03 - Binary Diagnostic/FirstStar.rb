require './BinaryDiagnostic'

test = BinaryDiagnosticMachine.new(File.read('./testdata.txt'))
test.solve_simple_diagnostic