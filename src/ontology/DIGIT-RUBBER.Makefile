## Customize Makefile settings for DIGIT-RUBBER
## 
## If you need to customize your Makefile, make
## changes here rather than in the main Makefile

##################
#   components   #
##################

$(COMPONENTSDIR)/digitrubber_terms.owl: $(TEMPLATEDIR)/digitrubber_terms.tsv
	if [ $(COMP) = true ] ; then $(ROBOT) template \
		--merge-after --input $(SRC) --add-prefixes config/context.json \
		--template $< --output $@; fi
	if [ $(COMP) = true ] ; then $(ROBOT) annotate -i $@ \
		--ontology-iri $(ONTBASE)/$@ \
		--version-iri $(ONTBASE)/releases/$(VERSION)/$@ \
		--annotation rdfs:comment "This component is derived from the 'src/templates/digitrubber_terms.tsv', which is edited manually by domain experts." \
		convert -f ofn --output $@; fi

