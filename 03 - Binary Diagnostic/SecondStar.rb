require './BinaryDiagnostic'

test = BinaryDiagnosticMachine.new(File.readlines('./testdata.txt'))
test.solve_advanced_diagnostic