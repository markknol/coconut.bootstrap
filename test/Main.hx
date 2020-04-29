package;

import js.Browser.document;
import js.Browser.window;
import js.Browser.location;
import bootstrap.*;
import bootstrap.Container;
import bootstrap.types.Variant;
import bootstrap.types.Size;
import bootstrap.Bootstrap;
import coconut.Ui.hxx;
import coconut.vdom.View;
import coconut.ui.Children;
import tink.domspec.ClassName;

using StringTools;

class Main {
	static function main() {
		coconut.ui.Renderer.mount(
			cast document.body.appendChild(document.createDivElement()), hxx('<Root />')
		);
	}
}

class Root extends View {
	function render() '
	<Container fluid>
		<Row>
			<Col className="col-lg-2">
				<div class="sticky-top border-right py-3">
					<dl>
						<dt><a href="#components">Components</a></dt>
						<dd><a href="#alert">Alert</a></dd>
						<dd><a href="#badge">Badge / Pill</a></dd>
						<dd><a href="#breadcrumb">Breadcrumb</a></dd>
						<dd><a href="#button">Buttons</a></dd>
						<dd><a href="#button-group">Button Group</a></dd>
						<dd><a href="#card">Card</a></dd>
						<dd><a href="#dropdown">Dropdown</a></dd>
						<dd><a href="#image">Images</a></dd>
					</dl>
				</div>
			</Col>
			<Col>
				<h1 class="display-4 my-5">Coconut.ui 🥥 <small><Badge variant=${Info}>bootstrap components</Badge></small></h1>
				<H2 name="components">Components</H2>
				<hr/>
				<H3 name="alert">Alert</H3>
				<p class="lead">Provide contextual feedback messages for typical user actions with the handful of available and flexible alert messages.</p>
				<previewSection>
					<for ${variant in Variant.all}>
						<Alert variant=${variant} dismissible>
							This is a ${variant} alert. Check it out!
						</Alert>
					</for>
					<codeExample>${"
						<for ${variant in Variant.all}>
						<Alert variant=${variant} dismissible>
							This is a ${variant} alert. Check it out!
						</Alert>
						</for>
					"}</codeExample>

					<H4 name="alert-heading">Alert Heading</H4>
					<let variant=${Primary}>
						<Alert variant=${variant}>
							<Alert.Heading>Hey, nice to see you!</Alert.Heading>
							This is a ${variant} alert.
							<hr/>
							Everything works as intended.
						</Alert>
					</let>
					<codeExample>${"
						<let variant=${Primary}>
						<Alert variant=${variant}>
							<Alert.Heading>Hey, nice to see you!</Alert.Heading>
							<div>This is a ${variant} alert. </div>
							<hr/>
							<div>Everything works as intended.</div>
						</Alert>
					</let>
					"}</codeExample>
				</previewSection>

				<H3 name="badge">Badge</H3>
				<p class="lead">Badges scale to match the size of the immediate parent element by using relative font sizing and em units.</p>
				<previewSection>
					<H4 name="badge-variants">Badge variants</H4>
					<p>Add any of the below mentioned <code>variant</code> modifier classes to change the appearance of a badge.</p>
					<for ${variant in Variant.all}>
						<Badge variant=${variant}>${variant}</Badge>${" "}
					</for>
					<codeExample>${"
						<for ${variant in Variant.all}><Badge variant=${variant}>${variant}</Badge></for>
					"}</codeExample>

					<H4 name="badge-pill">Pill badge</H4>
					<p> Pill badges use the <code>pill</code> modifier class to make badges more rounded.</p>
					<for ${variant in Variant.all}>
						<Badge variant=${variant} pill=${true}>${variant}</Badge>${" "}
					</for>
					<codeExample>${"
						<for ${variant in Variant.all}><Badge variant=${variant} pill=${true}>${variant}</Badge></for>
					"}</codeExample>
				</previewSection>
				
				<H3 name="breadcrumb">Breadcrumb</H3>
				<p class="lead">Indicate the current page’s location within a navigational hierarchy that automatically adds separators via CSS.</p>
				<previewSection>
					<Breadcrumb>
						<Breadcrumb.Item href="#">Home</Breadcrumb.Item>
						<Breadcrumb.Item href="https://getbootstrap.com/docs/4.0/components/breadcrumb/">
							Library
						</Breadcrumb.Item>
						<Breadcrumb.Item active>Data</Breadcrumb.Item>
					</Breadcrumb>
					<codeExample>${"
						<Breadcrumb>
							<Breadcrumb.Item href='#'>Home</Breadcrumb.Item>
							<Breadcrumb.Item href='https://getbootstrap.com/docs/4.0/components/breadcrumb/'>
								Library
							</Breadcrumb.Item>
							<Breadcrumb.Item active>Data</Breadcrumb.Item>
						</Breadcrumb>
					"}</codeExample>
				</previewSection>
				
				<H3 name="button">Buttons</H3>
				<p class="lead">Custom button styles for actions in forms, dialogs, and more with support for multiple sizes, states, and more.</p>
				<previewSection>
					<H4 name="button-normal">Normal buttons</H4>
					<p>Use any of the available button style types to quickly create a styled button. Just modify the <code>variant</code> prop.</p>
					<for ${variant in Variant.all}>
						<Button variant=${variant}>${variant}</Button>${" "}
					</for>
					<codeExample>${"
						<for ${variant in Variant.all}>
							<Button variant=${variant}>${variant}</Button>
						</for>
					"}</codeExample>

					<H4 name="button-outline">Outline buttons</H4>
					<p>For a lighter touch, Buttons also come in <code>outline-*</code> variants with no background color.</p>
					<for ${variant in Variant.allOutline}>
						<Button variant=${variant}>${variant}</Button>${" "}
					</for>
					<codeExample>${"
						<for ${variant in Variant.allOutline}>
							<Button variant=${variant}>${variant}</Button>
						</for>
					"}</codeExample>
					
					<H4 name="button-size">Sizes</H4>
					<p>Fancy larger or smaller buttons? Add <code>size=$${Large}</code>, <code>size=$${Small}</code> for additional sizes.</p>
					<Button size=${Large} variant=${Primary}>Large button</Button>${" "}
					<Button size=${Large} variant=${Secondary}>Large button</Button>${" "}
					<Button size=${Small} variant=${Primary}>Small button</Button>${" "}
					<Button size=${Small} variant=${Secondary}>Small button</Button>${" "}

					<codeExample>${"
						<Button size=${Large} variant=${Primary}>Large button</Button>
						<Button size=${Large} variant=${Secondary}>Large button</Button>
						<Button size=${Small} variant=${Primary}>Small button</Button>
						<Button size=${Small} variant=${Secondary}>Small button</Button>
					"}</codeExample>

					<H4 name="button-disabled">Disabled / Active</H4>
					<Button variant=${Primary} disabled>Disabled button</Button>${" "}
					<Button variant=${Secondary} disabled>Disabled button</Button>${" "}
					<Button variant=${Primary} active>Active button</Button>${" "}
					<Button variant=${Secondary} active>Active button</Button>${" "}
					
					<codeExample>${"
						<Button variant=${Primary} disabled>Disabled button</Button>
						<Button variant=${Secondary} disabled>Disabled button</Button>
						<Button variant=${Primary} active>Active button</Button>
						<Button variant=${Secondary} active>Active button</Button>
					"}</codeExample>

					<H4 name="button-types">Types</H4>
					<Button href="#">Hyperlink</Button>${" "}
					<Button type=${Submit}>Submit</Button>${" "}
					<Button type=${Reset}>Reset</Button>${" "}
					<Button type=${Input}>Input</Button>${" "}
					<Button type=${Default}>Button</Button>${" "}
					
					<codeExample>${"
						<Button href='#'>Hyperlink</Button>
						<Button type=${Submit}>Submit</Button>
						<Button type=${Reset}>Reset</Button>
						<Button type=${Input}>Input</Button>
						<Button type=${Default}>Button</Button>
					"}</codeExample>
				</previewSection>

				<H3 name="button-group">ButtonGroup / ButtonToolbar</H3>
				<p class="lead">Group a series of buttons together on a single line with the button group.</p>
				<previewSection>
					<ButtonToolbar ariaLabel="Toolbar with button groups">
						<ButtonGroup className="mr-2" ariaLabel="First group">
							<for ${idx in 1...5}><Button>${Std.string(idx)}</Button>${" "}</for>
						</ButtonGroup>
						<ButtonGroup className="mr-2" ariaLabel="Second group">
							<Button>5</Button> <Button>6</Button> <Button>7</Button>
						</ButtonGroup>
						<ButtonGroup ariaLabel="Third group">
							<Button>8</Button>
						</ButtonGroup>
					</ButtonToolbar>
					
					<codeExample>${"
						<ButtonToolbar ariaLabel='Toolbar with button groups'>
							<ButtonGroup className='mr-2' ariaLabel='First group'>
								<for ${idx in 1...5}><Button>${Std.string(idx)}</Button></for>
							</ButtonGroup>
							<ButtonGroup className='mr-2' ariaLabel='Second group'>
								<Button>5</Button> <Button>6</Button> <Button>7</Button>
							</ButtonGroup>
							<ButtonGroup ariaLabel='Third group'>
								<Button>8</Button>
							</ButtonGroup>
						</ButtonToolbar>
					"}</codeExample>
				</previewSection>
				
				<H3 name="card">Card</H3>
				<p class="lead">Bootstrap’s cards provide a flexible and extensible content container with multiple variants and options.</p>
				<previewSection>
					<Card>
						<Card.Header>Card Header</Card.Header>
						<Card.Body>
							<Card.Title>Card Title</Card.Title>
							<Card.Subtitle class="mb-2 text-muted">Card Subtitle</Card.Subtitle>
							<Card.Text>Some quick example text to build on the card title and make up the bulk of the card content.</Card.Text>
							<Card.Link href="#">Card link</Card.Link>
							<Card.Link href="#">Another link</Card.Link>
						</Card.Body>
						<Card.Footer>Card Footer</Card.Footer>
					</Card>
					<codeExample>${"
						<Card>
							<Card.Header>Card Header</Card.Header>
							<Card.Body>
								<Card.Title>Card Title</Card.Title>
								<Card.Subtitle class='mb-2 text-muted'>Card Subtitle</Card.Subtitle>
								<Card.Text>Some quick example text to build on the card title and make up the bulk of the card content.</Card.Text>
								<Card.Link href='#'>Card link</Card.Link>
								<Card.Link href='#'>Another link</Card.Link>
							</Card.Body>
							<Card.Footer>Card Footer</Card.Footer>
						</Card>
					"}</codeExample>
				</previewSection>

				<H3 name="dropdown">Dropdown</H3>
				<p class="lead">Toggle contextual overlays for displaying lists of links and more with the Bootstrap dropdown.</p>
				<previewSection>
					<Dropdown>
						<Dropdown.Toggle variant=${Success} id="dropdown-menu">
							Dropdown Button
						</Dropdown.Toggle>
						<Dropdown.Menu id="dropdown-menu">
							<Dropdown.Item href="#/action-1">Action</Dropdown.Item>
							<Dropdown.Item href="#/action-2">Another action</Dropdown.Item>
							<Dropdown.Item href="#/action-3">Something else</Dropdown.Item>
						</Dropdown.Menu>
					</Dropdown>
				</previewSection>

				
				<H3 name="image">Images</H3>
				<p class="lead">Documentation and examples for opting images into responsive behavior (so they never become larger than their parent elements) and add lightweight styles to them—all via classes.</p>
				<previewSection>
					<H4 name="image-shape">Image shapes</H4>
					<p>Use the <code>rounded</code>, <code>roundedCircle</code> and <code>thumbnail</code> props to customise the image.</p>
					<Image src="https://placekitten.com/150/150" alt="Lorum ipsum" />${" "}
					<Image src="https://placekitten.com/150/150" alt="Lorum ipsum" rounded />${" "}
					<Image src="https://placekitten.com/150/150" alt="Lorum ipsum" roundedCircle />${" "}
					<Image src="https://placekitten.com/150/150" alt="Lorum ipsum" thumbnail />${" "}
				
					<codeExample>${"
						<Image src='https://placekitten.com/150/150' alt='Lorum ipsum' />
						<Image src='https://placekitten.com/150/150' alt='Lorum ipsum' rounded />
						<Image src='https://placekitten.com/150/150' alt='Lorum ipsum' roundedCircle />
						<Image src='https://placekitten.com/150/150' alt='Lorum ipsum' thumbnail />
					"}</codeExample>
						
					<H4 name="image-fluid">Fluid image</H4>
					<p>Use the <code>fluid</code> to scale image nicely to the parent element.</p>
					<Image src="https://placekitten.com/1024/400" alt="Lorum ipsum" fluid/>${" "}
					<codeExample>${"
						<Image src='https://placekitten.com/1024/400' alt='Lorum ipsum' fluid />
					"}</codeExample>
					
				</previewSection>
			</Col>
		</Row>
	</Container>
	';

	function viewDidRender():Void {
		// make sure hash in url is used, with this little hack
		var hash = location.hash.substr(1);
		location.hash = "";
		window.setTimeout(() -> location.hash = hash, 0);
	}

	public static function previewSection(attr:{children:Children}) {
		return Bootstrap.create('border rounded p-4 my-3 mb-5 bg-white', attr.children);
	}

	public static function codeExample(attr:{children:String}) {
		var formattedCode:String = js.Syntax.code("window.formatCode({0})", attr.children);
		return hxx('<pre class="border rounded p-4 my-1 mb-3"><code>${formattedCode}</code></pre>');
	}

	public static function H2(attr:{?name:String, children:Children}) '
		<h2 class="mt-3"><if ${attr.name!=null}><a id=${attr.name} href="#${attr.name}">#</a> </if>${...attr.children}</h2>
	';

	public static function H3(attr:{?name:String, children:Children}) '
		<h3 class="mt-3"><if ${attr.name!=null}><a id=${attr.name} href="#${attr.name}">#</a> </if>${...attr.children}</h3>
	';

	public static function H4(attr:{?name:String, children:Children}) '
		<h4 class="mt-3"><if ${attr.name!=null}><a id=${attr.name} href="#${attr.name}">#</a> </if>${...attr.children}</h4>
	';
}
