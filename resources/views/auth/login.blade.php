@extends('layouts.app')

@section('content')
<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-8">
            <div class="card">
                <div class="card-header">دخول</div>

                <div class="card-body">
                    <form method="POST" action="{{ route('sendOTP') }}">
                        @csrf

                        <div class="row mb-3">
                            <label for="email" class="col-md-4 col-form-label text-md-end">رقم الهاتف</label>

                            <div class="col-md-6">
                                <input id="phone_number" type="text"
                                       class="form-control @error('phone_number') is-invalid @enderror"
                                       name="phone_number" value="{{ old('phone_number') }}" required
                                       autocomplete="phone_number" autofocus>

                                @error('phone_number')
                                <span class="invalid-feedback" role="alert">
                                        <strong>{{ $message }}</strong>
                                    </span>
                                @enderror
                            </div>
                        </div>
                        <div class="row mb-0">
                            <div class="col-md-6 offset-md-4">
                                <button type="submit" class="btn btn-primary">
                                   استمرار
                                </button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection
