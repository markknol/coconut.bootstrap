package;

import js.Browser.document;
import js.Browser.window;
import js.Browser.location;
import bootstrap.*;
import bootstrap.Container;
import bootstrap.Nav;
import bootstrap.types.Variant;
import bootstrap.types.Size;
import coconut.vdom.Renderer.hxx;
import coconut.vdom.View;
import coconut.ui.Children;
import tink.domspec.ClassName;
import cix.Style.rule as css;

class Main {
	static function main() {
		coconut.ui.Renderer.mount(
			cast document.body.appendChild(document.createDivElement()), hxx('<Root />')
		);

		observeAreas();
	}

	static function observeAreas() {
		#if js
		var links = document.querySelectorAll('div[data-area]');
		inline function asElement(v) return Std.downcast(v, js.html.Element);
		var intersectionCallback = (entries:Array<js.html.IntersectionObserverEntry>, _) -> {
			for (entry in entries) {
				if (entry.target.dataset.area != null) {
					var elmts = document.querySelectorAll('#navigation a[href="#${entry.target.dataset.area}"]');
					for (el in elmts) {
						var el = asElement(el);
						(entry.isIntersecting ? el.classList.add : el.classList.remove)('font-weight-bold');
					}
				}
			};
		};
		var observer = new js.html.IntersectionObserver(intersectionCallback, {threshold: 1 / 4});
		for (link in links) {
			observer.observe(asElement(link));
		}
		#end
	}
}

class Root extends View {
	function render() '
	<Container fluid>
		<Row>
			<Col className="col-lg-2">
				<div class=${Styles.navColumn.add("sticky-top border-right py-3")} id="navigation">
					<Nav vertical>
						<items>
							<item url="#components"><strong>Components</strong></item>
							<item url="#alert">Alert</item>
							<item url="#badge">Badge / Pill</item>
							<item url="#breadcrumb">Breadcrumb</item>
							<item url="#button">Buttons</item>
							<item url="#button-group">Button Group</item>
							<item url="#card">Card</item>
							<item url="#dropdown">Dropdown</item>
							<item url="#image">Images</item>
							<item url="#jumbotron">Jumbotron</item>
							<item url="#listgroup">List group</item>
							<item url="#pagination">Pagination</item>
							<item url="#progress">Progress bars</item>
							<item url="#spinner">Spinner</item>
							<item url="#nav">Nav</item>
							<item url="#table">Table</item>
						</items>
					</Nav>
				</div>
			</Col>
			<Col>
				<Container>
				<h1 class="display-4 my-5">Coconut.ui 🥥 <small><Badge variant=${Info}>bootstrap components</Badge></small></h1>
				
				Useful links:
				<ul>
					<li class="font-weight-bold"><svg role="img" style="width:24px;height:24px;zoom: 0.75;" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"><title>GitHub icon</title><path fill="#555" d="M12 .297c-6.63 0-12 5.373-12 12 0 5.303 3.438 9.8 8.205 11.385.6.113.82-.258.82-.577 0-.285-.01-1.04-.015-2.04-3.338.724-4.042-1.61-4.042-1.61C4.422 18.07 3.633 17.7 3.633 17.7c-1.087-.744.084-.729.084-.729 1.205.084 1.838 1.236 1.838 1.236 1.07 1.835 2.809 1.305 3.495.998.108-.776.417-1.305.76-1.605-2.665-.3-5.466-1.332-5.466-5.93 0-1.31.465-2.38 1.235-3.22-.135-.303-.54-1.523.105-3.176 0 0 1.005-.322 3.3 1.23.96-.267 1.98-.399 3-.405 1.02.006 2.04.138 3 .405 2.28-1.552 3.285-1.23 3.285-1.23.645 1.653.24 2.873.12 3.176.765.84 1.23 1.91 1.23 3.22 0 4.61-2.805 5.625-5.475 5.92.42.36.81 1.096.81 2.22 0 1.606-.015 2.896-.015 3.286 0 .315.21.69.825.57C20.565 22.092 24 17.592 24 12.297c0-6.627-5.373-12-12-12"/></svg> <a href="https://github.com/markknol/coconut.bootstrap">Coconut Bootstrap on GitHub</a></li>
					<li><a href="https://github.com/MVCoconut/coconut.ui/">Coconut.ui documentation</a></li>
					<li><a href="https://getbootstrap.com/docs/4.4/getting-started/introduction/">Official Bootstrap documentation</a>
						<ul>
							<li><a href="https://getbootstrap.com/docs/4.4/layout/overview/">Bootstrap layout</a></li>
							<li><a href="https://getbootstrap.com/docs/4.4/content/typography/">Bootstrap typography</a></li>
							<li><a href="https://getbootstrap.com/docs/4.4/utilities/borders/">Bootstrap utilities</a></li>
						</ul>
					</li>
					
				</ul>

				<H2 name="components">Components</H2>
				<hr/>

				<H3 name="alert">Alert</H3>
				<p class="lead">Provide contextual feedback messages for typical user actions with the handful of available and flexible alert messages.</p>
				<previewSection id="alert">
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
				<previewSection id="badge">
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
				<previewSection id="breadcrumb">
					<Breadcrumb>
						<items>
							<item href="#">Home</item>
							<item href="https://getbootstrap.com/docs/4.0/components/breadcrumb/">
								Library
							</item>
							<item active>Data</item>
						</items>
					</Breadcrumb>
					<codeExample>${"
						<Breadcrumb>
							<items>
								<item href='#'>Home</item>
								<item href='https://getbootstrap.com/docs/4.0/components/breadcrumb/'>
									Library
								</item>
								<item active>Data</item>
							</items>
						</Breadcrumb>
					"}</codeExample>
				</previewSection>

				<H3 name="button">Buttons</H3>
				<p class="lead">Custom button styles for actions in forms, dialogs, and more with support for multiple sizes, states, and more.</p>
				<previewSection id="button">
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
					<Button type=${Default}>Button</Button>${" "}
					<Button type=${Input}><label>Input</label></Button>${" "}
					<Button type=${Submit}><label>Submit</label></Button>${" "}
					<Button type=${Reset}><label>Reset</label></Button>${" "}
					<codeExample>${"
						<Button href='#'>Hyperlink</Button>
						<Button type=${Default}>Button</Button>
						<Button type=${Input}><label>Input</label></Button>
						<Button type=${Submit}><label>Submit</label></Button>
						<Button type=${Reset}><label>Reset</label></Button>
					"}</codeExample>
					
					<Blockquote>
						<strong>Note</strong> for type Submit/Reset we provide a label, since it cannot render children in its rendered input value <code>&lt;input value=$${label} /&gt;</code>
					</Blockquote>

				</previewSection>

				<H3 name="button-group">ButtonGroup / ButtonToolbar</H3>
				<p class="lead">Group a series of buttons together on a single line with the button group.</p>
				<previewSection id="button-group">
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
				<previewSection id="card">
					<Card>
						<Card.header>Card Header</Card.header>
						<Card.body>
							<Card.title>Card Title</Card.title>
							<Card.subtitle class="mb-2 text-muted">Card Subtitle</Card.subtitle>
							<Card.text>Some quick example text to build on the card title and make up the bulk of the card content.</Card.text>
							<Card.link href="#">Card link</Card.link>
							<Card.link href="#">Another link</Card.link>
						</Card.body>
						<Card.footer>Card Footer</Card.footer>
					</Card>
					<codeExample>${"
						<Card>
							<Card.header>Card Header</Card.header>
							<Card.body>
								<Card.title>Card Title</Card.title>
								<Card.subtitle class='mb-2 text-muted'>Card Subtitle</Card.subtitle>
								<Card.text>Some quick example text to build on the card title and make up the bulk of the card content.</Card.text>
								<Card.link href='#'>Card link</Card.link>
								<Card.link href='#'>Another link</Card.link>
							</Card.body>
							<Card.footer>Card Footer</Card.footer>
						</Card>
					"}</codeExample>
				</previewSection>

				<H3 name="dropdown">Dropdown</H3>
				<p class="lead">Toggle contextual overlays for displaying lists of links and more with the Bootstrap dropdown.</p>
				<previewSection id="dropdown">
					<Dropdown variant=${Success}>
						<caption>Dropdown Button</caption>
						<menu>
							<link url="#/action-1">Action</link>
							<link url="#/action-2">Another action</link>
							<divider />
							<link url="#/action-3">Something else</link>
						</menu>
					</Dropdown>
					<codeExample>${"
						<Dropdown variant=${Success}>
							<caption>Dropdown Button</caption>
							<menu>
								<link url='#/action-1'>Action</link>
								<link url='#/action-2'>Another action</link>
								<divider />
								<link url='#/action-3'>Something else</link>
							</menu>
						</Dropdown>
					"}</codeExample>
				</previewSection>


				<H3 name="image">Images</H3>
				<p class="lead">Documentation and examples for opting images into responsive behavior (so they never become larger than their parent elements) and add lightweight styles to them—all via classes.</p>
				<previewSection id="image">
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

				<H3 name="jumbotron">Jumbotron</H3>
				<p class="lead">A lightweight, flexible component that can optionally extend the entire viewport to showcase key content on your site.</p>
				<previewSection id="jumbotron">
					<Jumbotron>
						<h1>Hello, world!</h1>
						<p>This is a simple hero unit, a simple jumbotron-style component for calling extra attention to featured content or information.</p>
						<p><Button variant=${Primary}>Learn more</Button></p>
					</Jumbotron>
					<codeExample>${"
						<Jumbotron>
							<h1>Hello, world!</h1>
							<p>This is a simple hero unit, a simple jumbotron-style component for calling extra attention to featured content or information.</p>
							<p><Button variant=${Primary}>Learn more</Button></p>
						</Jumbotron>
					"}</codeExample>

					<H4 name="jumbotron-fluid">Fluid jumbotron</H4>
					<p>Use the <code>fluid</code> to make the jumbotron full width, and without rounded corners.</p>
					<Jumbotron fluid>
						<Container>
							<h1>Fluid jumbotron</h1>
							<p>This is a modified jumbotron that occupies the entire horizontal space of its parent.</p>
						</Container>
					</Jumbotron>
					<codeExample>${"
						<Jumbotron fluid>
							<Container>
								<h1>Fluid jumbotron</h1>
								<p>This is a modified jumbotron that occupies the entire horizontal space of its parent.</p>
							</Container>
						</Jumbotron>
					"}</codeExample>

				</previewSection>

				<H3 name="listgroup">List Group</H3>
				<p class="lead">List groups are a flexible and powerful component for displaying a series of content. Modify and extend them to support just about any content within.</p>
				<previewSection id="listgroup">
					<p>The most basic list group is an unordered list with list items and the proper classes. Build upon it with the options that follow, or with your own CSS as needed.
					Add <code>active</code> to an item to indicate the current active selection.
					Add <code>disabled</code> to make it appear disabled. </p>
					<p>For lists without interaction use <code>&lt;items&gt;</code></p>
					<ListGroup>
						<items>
							<item>Item 1</item>
							<item active>Item 2</item>
							<item>Item 3</item>
							<item disabled>Item 4</item>
							<item>Item 5</item>
						</items>
					</ListGroup>
					<codeExample>${"
						<ListGroup>
							<items>
								<item>Item 1</item>
								<item active>Item 2</item>
								<item>Item 3</item>
								<item disabled>Item 4</item>
								<item>Item 5</item>
							</items>
						</ListGroup>
					"}</codeExample>
					<H4 name="listgroup-links">List Group Links</H4>
					<p>For lists with hyperlinks (rendered to <code>&lt;a&gt;</code> tags) use <code>&lt;links&gt;</code>, each item will require a <code>href</code> prop.</p>
					<ListGroup>
						<links>
							<item href="#">Item 1</item>
							<item href="#" active>Item 2</item>
							<item href="#">Item 3</item>
							<item href="#" disabled>Item 4</item>
							<item href="#">Item 5</item>
						</links>
					</ListGroup>
					<codeExample>${"
						<ListGroup>
							<links>
								<item href='#'>Item 1</item>
								<item href='#' active>Item 2</item>
								<item href='#'>Item 3</item>
								<item href='#' disabled>Item 4</item>
								<item href='#'>Item 5</item>
							</links>
						</ListGroup>
					"}</codeExample>

					<H4 name="listgroup-buttons">List Group Buttons</H4>
					<p>For lists with buttons (rendered to <code>&lt;buttons&gt;</code> tags) use <code>&lt;buttons&gt;</code>, each item has optional <code>onclick</code> prop.</p>
					<ListGroup>
						<buttons>
							<item>Item 1</item>
							<item active>Item 2</item>
							<item>Item 3</item>
							<item disabled>Item 4</item>
							<item>Item 5</item>
						</buttons>
					</ListGroup>
					<codeExample>${"
						<ListGroup>
							<buttons>
								<item>Item 1</item>
								<item active>Item 2</item>
								<item>Item 3</item>
								<item disabled>Item 4</item>
								<item>Item 5</item>
							</buttons>
						</ListGroup>
					"}</codeExample>

					<H4 name="listgroup-variants">List group variants</H4>
					<p>For lists with buttons (rendered to <code>&lt;buttons&gt;</code> tags) use <code>&lt;buttons&gt;</code>, each item has optional <code>onclick</code> prop.</p>
					<ListGroup>
						<items>
							<for ${variant in Variant.all}>
								<item variant=${variant}>Item ${variant}</item>
							</for>
						</items>
					</ListGroup>
					<codeExample>${"
						<ListGroup>
							<items>
								<for ${variant in Variant.all}>
									<item variant=${variant}>Item ${variant}</item>
								</for>
							</items>
						</ListGroup>
					"}</codeExample>
				</previewSection>

				<H3 name="pagination">Pagination</H3>
				<p class="lead">A lightweight, flexible component that can optionally extend the entire viewport to showcase key content on your site.</p>
				<previewSection id="pagination">
					<H4 name="pagination-size">Pagination sizes</H4>
					<p>Larger or smaller pagination? Add <code>size=$${Large}</code>, <code>size=$${Small}</code> for additional sizes.</p>
					<Pagination>
						<items>
							<for ${idx in 1...5}>
								<item active=${idx == 2}>${idx}</item>
							</for>
						</items>
					</Pagination>
					<Pagination size=${Large}>
						<items>
							<for ${idx in 1...5}>
								<item active=${idx == 2}>${idx}</item>
							</for>
						</items>
					</Pagination>
					<Pagination size=${Small}>
						<items>
							<for ${idx in 1...5}>
								<item active=${idx == 2}>${idx}</item>
							</for>
						</items>
					</Pagination>
					<codeExample>${"
						<Pagination>
							<items>
								<for ${idx in 1...5}>
									<item active=${idx == 2}>${idx}</item>
								</for>
							</items>
						</Pagination>
						<Pagination size=${Large}>
							<items>
								<for ${idx in 1...5}>
									<item active=${idx == 2}>${idx}</item>
								</for>
							</items>
						</Pagination>
						<Pagination size=${Small}>
							<items>
								<for ${idx in 1...5}>
									<item active=${idx == 2}>${idx}</item>
								</for>
							</items>
						</Pagination>
					"}</codeExample>

					<H4 name="pagination-extra">Pagination helpers</H4>
					<p>For building more complex pagination UI, there are few convenient sub-components for adding
					"First", "Previous", "Next", and "Last" buttons, as well as an Ellipsis item for indicating previous or continuing results.
					</p>
					<Pagination>
						<items>
							<first href="#" />
							<prev href="#"/>
							<item href="#">{1}</item>
							<ellipsis />
							<item href="#">{10}</item>
							<item href="#">{11}</item>
							<item href="#" active>{12}</item>
							<item href="#">{13}</item>
							<item disabled>{14}</item>
							<ellipsis />
							<item href="#">{20}</item>
							<next href="#" />
							<last href="#" />
						</items>
					</Pagination>
					<codeExample>${"
						<Pagination>
							<items>
								<first href='#' />
								<prev href='#'/>
								<item href='#'>{1}</item>
								<ellipsis />
								<item href='#'>{10}</item>
								<item href='#'>{11}</item>
								<item href='#' active>{12}</item>
								<item href='#'>{13}</item>
								<item disabled>{14}</item>
								<ellipsis />
								<item href='#'>{20}</item>
								<next href='#' />
								<last href='#' />
							</items>
						</Pagination>
					"}</codeExample>
				</previewSection>


				<H3 name="progress">Progress bars</H3>
				<p class="lead">Provide up-to-date feedback on the progress of a workflow or action with simple yet flexible progress bars.</p>
				<previewSection id="progress">
					<p>Default progress bar. Add a <code>label</code> prop to show a visible percentage. Add a <code>srOnly</code> prop to hide the label visually.
					Add a <code>height</code> prop to give it a different height.</p>
					<let now=${40}>
						<ProgressBar now=${now} label=${'$now%'} className="my-1" />
						<ProgressBar now=${now} label=${'$now%'} srOnly className="my-1" />
						<ProgressBar now=${now} label=${'$now%'} height=${25} className="my-1" />
					</let>
					<codeExample>${"
						<let now=${40}>
							<ProgressBar now=${now} label=${'$now%'} />
							<ProgressBar now=${now} label=${'$now%'} srOnly/>
							<ProgressBar now=${now} label=${'$now%'} height='25' />
						</let>
					"}</codeExample>

					<H4 name="progress-variant">Progress bars variants</H4>
					<p>Progress bars use some of the same button and alert classes for consistent styles.</p>

					<ProgressBar variant=${Success} now=${40} className="my-1" />
					<ProgressBar variant=${Info} now=${20} className="my-1" />
					<ProgressBar variant=${Warning} now=${60} className="my-1" />
					<ProgressBar variant=${Danger} now=${80} className="my-1" />
					<codeExample>${"
						<ProgressBar variant=${Success} now=${40}  />
						<ProgressBar variant=${Info} now=${20} />
						<ProgressBar variant=${Warning} now=${60} />
						<ProgressBar variant=${Danger} now=${80} />
					"}</codeExample>

					<H4 name="progress-variant">Striped / animated progress bars</H4>
					<p>Uses a gradient to create a striped effect.</p>
					<ProgressBar striped variant=${Success} now=${40} className="my-1" />
					<ProgressBar striped variant=${Info} now=${20} className="my-1" />
					<ProgressBar striped animated variant=${Warning} now=${60} className="my-1" />
					<ProgressBar striped animated variant=${Danger} now=${80} className="my-1" />
					<codeExample>${"
						<ProgressBar striped variant=${Success} now=${40}  />
						<ProgressBar striped variant=${Info} now=${20} />
						<ProgressBar striped animated variant=${Warning} now=${60} />
						<ProgressBar striped animated variant=${Danger} now=${80} />
					"}</codeExample>

				</previewSection>

				<H3 name="spinner">Spinner</H3>
				<p class="lead">Indicate the loading state of a component or page with Bootstrap spinners.</p>
				<previewSection id="spinner">
					<p>Default spinner. Add a <code>small</code> prop to make it small size.</p>
					<Spinner className="m-1" /> <Spinner small className="m-1" />
					<codeExample>${"
						<Spinner />
						<Spinner small />
					"}</codeExample>

					<H4 name="spinner-variants">Grow variants</H4>
					<for ${variant in Variant.all}>
						<Spinner variant=${variant} className="m-1" />
					</for>
					<codeExample>${"
						<for ${variant in Variant.all}>
							<Spinner variant=${variant} />
						</for>
					"}</codeExample>

					<H4 name="spinner-type">Grow spinner</H4>
					<p>If you don’t want a bordered spinner, switch to the grow spinner by adding <code>type=$${Grow}</code>.</p>
					<for ${variant in Variant.all}>
						<Spinner type=${Grow} variant=${variant} className="m-1" />
					</for>
					<codeExample>${"
						<for ${variant in Variant.all}>
							<Spinner type=${Grow} variant=${variant} />
						</for>
					"}</codeExample>

					<H4 name="spinner-button">Button with spinner</H4>
					<p>Example of how to combine the spinner in a button. </p>
					<Button>
						<Spinner variant=${Light} small /> Hold on..
					</Button>
					<codeExample>${"
						<Button>
							<Spinner variant=${Light} small /> Hold on..
						</Button>
					"}</codeExample>
					
					<H4 name="spinner-accessibility">Accessibility</H4>
					<p>
						To ensure the maximum accessibility for spinner components it is recommended to provide a relevant ARIA role property, 
						and include screenreader-only readable text representation of the spinner\'s meaning inside the component using Bootstrap\'s <code>sr-only</code> class.
					</p>
					<p>
						By default the accessibility is taken care of, the internal <code>sr-only</code> label is set to <code>"Loading.."</code>. 
						To change this, simply provide text in the component.
					</p>
					<Spinner variant=${Success}>Loading..</Spinner>
					<codeExample>${"
						<Spinner variant=${Success}>Loading..</Spinner>
					"}</codeExample>
				</previewSection>
			

				<H3 name="nav">Nav</H3>
				<p class="lead">Documentation and examples for how to use Bootstrap’s included navigation components.</p>
				<previewSection id="nav">
					<p>Use the <code>active</code> prop to highlight an item. Use the <code>disabled</code> prop to visually disable to item.</p>
					<Nav>
						<items>
							<item url="#" active>Item 1</item>
							<item url="#">Item 2</item>
							<item url="#">Item 3</item>
							<item url="#" disabled>Item 4</item>
						</items>
					</Nav>
					<codeExample>${"
						<Nav>
							<items>
								<item url='#' active>Item 1</item>
								<item url='#'>Item 2</item>
								<item url='#'>Item 3</item>
								<item url='#' disabled>Item 4</item>
							</items>
						</Nav>
					"}</codeExample>

					<H4 name="nav-pill">Pills Nav</H4>
					<p>Add <code>type=$${Pills}</code></p>
					<Nav type=${Pills}>
						<items>
							<item url="#" active>Item 1</item>
							<item url="#">Item 2</item>
							<item url="#">Item 3</item>
							<item url="#" disabled>Item 4</item>
						</items>
					</Nav>
					<codeExample>${"
						<Nav type=${Pills}>
							<items>
								<item url='#' active>Item 1</item>
								<item url='#'>Item 2</item>
								<item url='#'>Item 3</item>
								<item url='#' disabled>Item 4</item>
							</items>
						</Nav>
					"}</codeExample>

					<H4 name="nav-tabs">Tabbed Nav</H4>
					<p>Add <code>type=$${Tabs}</code></p>
					<Nav type=${Tabs}>
						<items>
							<item url="#" active>Item 1</item>
							<item url="#">Item 2</item>
							<item url="#">Item 3</item>
							<item url="#" disabled>Item 4</item>
						</items>
					</Nav>
					<codeExample>${"
						<Nav type=${Tabs}>
							<items>
								<item url='#' active>Item 1</item>
								<item url='#'>Item 2</item>
								<item url='#'>Item 3</item>
								<item url='#' disabled>Item 4</item>
							</items>
						</Nav>
					"}</codeExample>

					<H4 name="nav-tabs">Justified Nav</H4>
					<p>Add <code>justified</code> to the nav.</p>
					<Nav type=${Tabs} justified>
						<items>
							<item url="#" active>Item 1</item>
							<item url="#">Item 2</item>
							<item url="#">Item 3</item>
							<item url="#" disabled>Item 4</item>
						</items>
					</Nav>
					<codeExample>${"
						<Nav type=${Tabs} justified>
							<items>
								<item url='#' active>Item 1</item>
								<item url='#'>Item 2</item>
								<item url='#'>Item 3</item>
								<item url='#' disabled>Item 4</item>
							</items>
						</Nav>
					"}</codeExample>
					
					<H4 name="nav-tabs">Filled Nav</H4>
					<p>Add <code>fill</code> to the nav.</p>
					<Nav type=${Tabs} fill>
						<items>
							<item url="#" active>Item 1</item>
							<item url="#">Item 2</item>
							<item url="#">Item 3</item>
							<item url="#" disabled>Item 4</item>
						</items>
					</Nav>
					<codeExample>${"
						<Nav type=${Tabs} fill>
							<items>
								<item url='#' active>Item 1</item>
								<item url='#'>Item 2</item>
								<item url='#'>Item 3</item>
								<item url='#' disabled>Item 4</item>
							</items>
						</Nav>
					"}</codeExample>

				</previewSection>

				<H3 name="table">Tables</H3>
				<p class="lead">Tables allows to present tabular data / arrange data into rows and columns.</p>
				<previewSection id="table">
					<p>Use the <code>striped</code>, <code>bordered</code> and <code>hover</code> props to customise the table.</p>
					<Table bordered striped hover>
						<thead>
							<tr>
								<th>#</th>
								<th>Table heading</th><th>Table heading</th><th>Table heading</th>
							</tr>
						</thead>
						<tbody>
							<for ${idx in 1...5}>
								<tr>
									<td>$idx</td>
									<td>Table cell</td><td>Table cell</td><td>Table cell</td>
								</tr>
							</for>
						</tbody>
					</Table>
					<codeExample>${"
						<Table>
							<thead>
								<tr>
									<th>#</th><th>Table heading</th><th>Table heading</th><th>Table heading</th>
								</tr>
							</thead>
							<tbody>
								<for ${idx in 1...5}>
									<tr>
										<td>$idx</td><td>Table cell</td><td>Table cell</td><td>Table cell</td>
									</tr>
								</for>
							</tbody>
						</Table>
					"}</codeExample>
					
					<H4 name="table-dark">Dark table</H4>
					<p>Use <code>dark</code> to created inverted table.</p>
					<Table dark>
						<thead>
							<tr>
								<th>#</th><th>Table heading</th><th>Table heading</th>
							</tr>
						</thead>
						<tbody>
							<for ${idx in 1...5}>
								<tr>
									<td>$idx</td>
									<td>Table cell</td>
									<td>Table cell</td>
								</tr>
							</for>
						</tbody>
					</Table>
					<codeExample>${"
						<Table dark>
							<thead>
								<tr>
									<th>#</th><th>Table heading</th><th>Table heading</th>
								</tr>
							</thead>
							<tbody>
								<for ${idx in 1...5}>
									<tr>
										<td>$idx</td>
										<td>Table cell</td>
										<td>Table cell</td>
									</tr>
								</for>
							</tbody>
						</Table>
					"}</codeExample>

					<H4 name="table-responsive">Responsive table</H4>
					<p>Use <code>responsive=$${Small}</code>, <code>responsive=$${Default}</code>, <code>responsive=$${Large}</code>, <code>responsive=$${ExtraLarge}</code> as needed to create responsive tables up to a particular breakpoint. From that breakpoint and up, the table will behave normally and not scroll horizontally.</p>
					<Table responsive=${ExtraLarge}>
						<thead>
							<tr>
								<th>#</th>
								<for ${_ in 0...6}><th>Table heading</th></for>
							</tr>
						</thead>
						<tbody>
							<for ${idx in 1...5}>
								<tr>
									<td>$idx</td>
									<for ${_ in 0...6}><td>Table cell</td></for>
								</tr>
							</for>
						</tbody>
					</Table>
					<codeExample>${"
						<Table responsive=${ExtraLarge}>
							<thead>
								<tr>
									<th>#</th>
									<for ${_ in 0...6}><th>Table heading</th></for>
								</tr>
							</thead>
							<tbody>
								<for ${idx in 1...5}>
									<tr>
										<td>$idx</td>
										<for ${_ in 0...6}><td>Table cell</td></for>
									</tr>
								</for>
							</tbody>
						</Table>
					"}</codeExample>
				</previewSection>
				</Container>
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

	public static function previewSection(attr:{id:String, children:Children}) '
		<div data-area=${attr.id} class="shadow p-3 border rounded p-4 my-3 mb-5 bg-white">${...attr.children}</div>
	';

	public static function codeExample(attr:{children:String}) {
		var formattedCode:String = js.Syntax.code("window.formatCode({0})", attr.children);
		return hxx('<pre class=${Styles.pre.add("border rounded p-4 my-1 mb-3")}><code>${formattedCode}</code></pre>');
	}

	public static function H2(attr:{?name:String, children:String}) '
		<h2 class="mt-3"><if ${attr.name != null}><a id=${attr.name} href="#${attr.name}">#</a> </if>${attr.children}</h2>
	';

	public static function H3(attr:{?name:String, children:String}) '
		<h3 class="mt-5"><if ${attr.name != null}><a id=${attr.name} href="#${attr.name}">#</a> </if>${attr.children}</h3>
	';

	public static function H4(attr:{?name:String, children:String}) '
		<h4 class="mt-4"><if ${attr.name != null}><a id=${attr.name} href="#${attr.name}">#</a> </if>${attr.children}</h4>
	';

	public static function Blockquote(attr:{?name:String, children:Children}) '
		<div class="p-3 mb-2 bg-light text-dark border border-info rounded">${...attr.children}</div>
	';
}

class Styles {
	public static final navColumn = css('
		@media (min-width: 924px) {
			min-height: 100%;
			background: #f00;
		}
		@media (max-width: 924px) {
			min-height: 100%;
			background: #ff0;
		}
	');

	public static final pre = css('
		tab-size: 2;
		white-space: pre-wrap;
		background:#282c34;
		 code {
			color: rgb(197, 200, 198);
		}
	');

}