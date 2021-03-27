require 'asciidoctor'
require 'asciidoctor-bibtex'

rule /^C:/ => ->(path){path.to_s.gsub(/(\\|C\:)/, '\\' => '/', 'C:' => '/mnt/c')}

rule '.ad.html' => '.ad' do
	Asciidoctor.convert_file f.source,
		safe: unsafe
end

rule '.ad.pdf' => '.ad' do
	require 'asciidoctor-pdf'
	require 'asciidoctor-mathematical'
	Asciidoctor.convert_file f.source,
		attributes: {
			'mathematical-format' => 'svg',
		},
		backend: "pdf",
		safe: unsafe
end