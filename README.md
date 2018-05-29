# Whippersnapper_p4benchmark_with_p4-version-16_compatibility
This repository contains modifications done to the Whippersnapper P4 benchmark so as to generate P4 Version-16 codes which can help in the evaluation of the "PARSING FEATURE" of a P4 compiler.

# INTRODUCTION
P4 is a programming language designed to allow programming of packet forwarding planes. In contrast to a general purpose language such as C or Python, P4 is a domain-specific language with a number of constructs optimized around network data forwarding. P4 is an open-source, permissively licensed language and is maintained by a non-profit organization called the P4 Language Consortium. The language was originally described in a SIGCOMM CCR paper in 2014 titled “Programming Protocol-Independent Packet Processors”.

# Whippersnapper
As P4 and its associated compilers move beyond relative immaturity, there is a need for common evaluation criteria. Overall, whippersnapper has the following functionality:

• It identifies key language features, metrics, and parameters for evaluating P4 programs.

• It describes a set of synthetic benchmarks that systematically explore and evaluate those key features.

• It demonstrates the utility of the benchmark on case studies involving four different P4 compilers.

Some useful links :-

1. Whippersnapper research paper - https://conferences.sigcomm.org/sosr/2017/papers/sosr17-whippersnapper.pdf

2. Original whippersnapper repository - https://github.com/usi-systems/p4benchmark

The original whippersnapper repository creates p4-14 codes to evaluate p4 compilers for various features. This repository contains an extra added feature which can help generate p4-16 (new version) codes too along with all other features provided by the original repository. This functionality has only been implemented for the "PASRING FEATURE" of the p4 benchmark. The output is obtained in the 'output_16' directory.

Installation
------------

Run the following commands::

    pip install -r requirements.txt
    python setup.py install

Generate P4-16 Program and PCAP file for testing
---------------------------------------------

* **Benchmark parse field**

The generated P4 program parses Ethernet,
PTP and a customized header containing 4 fields and each field is 16-bit wide::

    p4benchmark --feature parse-field16 --fields 4

* **Benchmark parse header**

The generated P4 program parses Ethernet, PTP and
a customized number of headers each containing a customized number of fields.
Each field is 16-bit wide::

    p4benchmark --feature parse-header16 --fields 4 --headers 4

* **Benchmark parse complex**

The generated P4 program parses Ethernet, PTP and
a parse graph that has the depth of 2 and each node has 2 branches::

    p4benchmark --feature parse-complex16 --depth 2 --fanout 2
Generated Files
---------------

The `output_16` directory contains::

    $ ls output
    commands.txt  main.p4  run_switch.sh  run_test.py  test.pcap

    1. main.p4        The desired program to benchmark a particular feature of the P4 target
    2. test.pcap      Sample packet crafted to match the parser or tables
    3. run_switch.sh  Script to run and configure bmv2
    4. commands.txt   Match-action rules for tables
    5. run_test.py    Python packet generator and receiver
