#
# Makefile to generate specifications
#

.PHONY: clean all json franca vsi

all: clean json franca vsi csv

json:
	python2 ./tools/vspec2json.py -i:spec/VehicleSignalSpecification.id:1 -I ./spec ./spec/VehicleSignalSpecification.vspec vss_rel_$$(cat VERSION).json
	python2 ./tools/vspec2json.py -i:spec/genivi-demo.id:1 -I ./spec ./spec/genivi-demo.vspec genivi-demo_$$(cat VERSION).json

franca:
	python2 ./tools/vspec2franca.py -v $$(cat VERSION) -i:spec/VehicleSignalSpecification.id:1 -I ./spec ./spec/VehicleSignalSpecification.vspec vss_rel_$$(cat VERSION).fidl	
	python2 ./tools/vspec2franca.py -v $$(cat VERSION) -i:spec/genivi-demo.id:1 -I ./spec ./spec/genivi-demo.vspec genivi-demo_$$(cat VERSION).fidl

vsi:
	python2 ./tools/vspec2vsi.py -v $$(cat VERSION) -i:spec/VehicleSignalSpecification.id:1 -I ./spec ./spec/VehicleSignalSpecification.vspec vss_rel_$$(cat VERSION).vsi
	python2 ./tools/vspec2vsi.py -v $$(cat VERSION) -i:spec/genivi-demo.id:1 -I ./spec ./spec/genivi-demo.vspec genivi-demo_$$(cat VERSION).vsi

csv:
	python2 ./tools/vspec2csv.py -i:spec/VehicleSignalSpecification.id:1 -I ./spec ./spec/VehicleSignalSpecification.vspec vss_rel_$$(cat VERSION).csv
	python2 ./tools/vspec2csv.py -i:spec/genivi-demo.id:1 -I ./spec ./spec/genivi-demo.vspec genivi-demo_$$(cat VERSION).csv


clean:
	rm -f vss_rel_$$(cat VERSION).json vss_rel_$$(cat VERSION).fidl vss_rel_$$(cat VERSION).vsi vss_rel_$$(cat VERSION).csv genivi-demo_$$(cat VERSION).*
