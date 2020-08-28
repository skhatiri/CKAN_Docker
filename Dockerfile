FROM ckan/ckan

#upgrading base image to solve known issues with running CKAN with docker
#updates are done based on the following pull request:
#https://github.com/ckan/ckan/pull/5381/files


USER root
RUN ln -s $CKAN_VENV/bin/ckan /usr/local/bin/ckan
COPY ckan-entrypoint.sh /
CMD ["ckan","-c","etc/ckan/production.ini", "run", "--host", "0.0.0.0"]

#adding extension files to container

RUN git clone -b master https://github.com/skhatiri/CKAN_tag_extension.git  $CKAN_VENV/src/ckanext-tag_restriction/
#seting up the extension
RUN . $CKAN_VENV/bin/activate \
	&& cd $CKAN_VENV/src/ckanext-tag_restriction/ \
	&& python setup.py develop

RUN git clone -b master https://github.com/skhatiri/CKAN_DOI_field_extension.git  $CKAN_VENV/src/ckanext-DOI_field_extension/
#seting up the extension
RUN . $CKAN_VENV/bin/activate \
	&& cd $CKAN_VENV/src/ckanext-DOI_field_extension/ \
	&& python setup.py develop

