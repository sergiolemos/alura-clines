clean:
	@ mvn clean

package: clean
	@ mvn package -DskipTests

docker-image-clean: package
	@ docker build --rm -t caelum/clines-api:1.0 .

docker-image-build: docker-image-clean
	@ docker build -t caelum/clines-api:1.0 .

run: docker-image-build
	@ docker-compose up -d

stop:
	@ docker-compose down -v