

### 文件说明
1. seq.md；标记要修饰残基的序列文件
1. dna_analyzer.py：分析seq.md中序列，输出被修饰的残基的序号
1. dna_analysis_results.txt:输出的结果（dna_analyzer.py）

1. pdb_dna_modifier_H2F_bingo.py：两个功能，1）对所有原子进行全局修饰(主要是处理IUPAC/PDB原子名称与力场中的名称不一致时的情况，dna.arn本来是做这个用的但不知道为什么不起效果)；2）对PDB文件中的指定残基中的某原子进行修饰；
1. pdb_dna_modifier_H2F_bingo_v0_replacedRes_is_necessary.py：旧版本，必须指定要修饰的残基
1. Process_residue_modification.bsh：批量执行上述python脚本（pdb_dna_modifier_H2F_bingo.py）

### 使用说明
1. seq.md中列出了要处理的碱基序列，每一行是一个序列，其中后面有*号的是要对C2上的H进行F取代的碱基
1. 运行`python dna_analyzer.py`，会处理seq.md文件，生成dna_analysis_results.txt，其中列出各每一个序列的碱基数和要进行F取代的碱基号
1. 调用pdb_dna_modifier_H2F_bingo.py，指令如`python pdb_dna_modifier_H2F.py input.pdb output.pdb --chain A --residues 2-5,10 --resname DCF`,指定要进行原子取代的链名称、残基标号、被取代残基的新名称。采用residue_modification.bsh可以批量执行。
1. pdb_dna_modifier_H2F_bingo.py除了进行F取代外，还对几个原子进行了全局取代，可在`atom_rename_map = {"OP1": "O1P", "OP2": "O2P", "'HO5": "H5T", "'HO3": "H5T", "H5'": "H5'1", "'H5'": "H5'2"}`中进行修改。
